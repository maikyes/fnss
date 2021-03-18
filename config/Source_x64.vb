﻿Public Class Form1
    Public InitializedFine As Boolean = False
    Public UltimatePerformanceExists As Boolean = True

    Public CurrentState As Boolean = False

    Public LastClickTick = Environment.TickCount

    Public Ver As String = "V" & My.Application.Info.Version.Major & "." & My.Application.Info.Version.Minor

    Public CurrentPowerPlan As String = "381b4222-f694-41f0-9685-ff5bb260df2e"

    Public MaximumTimerResolution As UInteger = 5000

    Public MinimumTimerResolution As UInteger = 156250

    Public LastRegisteredTimerResolution As UInteger = 156250

    Public SupportedWinVersion As Boolean = True

    Public OS_Name As String = "Windows"

    Public Timer_Res_Enabled As Boolean = False

    <System.Runtime.InteropServices.DllImport("ntdll.dll", SetLastError:=True, CharSet:=Runtime.InteropServices.CharSet.Auto)> Public Shared Function NtQueryTimerResolution(ByRef outmin As UInteger, ByRef outmax As UInteger, ByRef outcurrent As UInteger) As Integer
    End Function
    <System.Runtime.InteropServices.DllImport("ntdll.dll", SetLastError:=True, CharSet:=Runtime.InteropServices.CharSet.Auto)> Public Shared Function NtSetTimerResolution(ByVal desired As UInteger, ByVal setres As Boolean, ByRef outcurrent As UInteger) As Integer
    End Function

    Sub CheckWin10()
        Dim _cv As Microsoft.Win32.RegistryKey
        Try
            _cv = My.Computer.Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion", False)
            Dim windows_name As String = _cv.GetValue("ProductName")
            OS_Name = windows_name
            If Not windows_name.Contains("Windows 10") Then
                Throw New Exception
            End If
            Dim win10release_string As String = _cv.GetValue("ReleaseId")
            OS_Name &= " build " & win10release_string
            Dim win10release_uint As UInteger = UInteger.Parse(win10release_string)
            If win10release_uint < 1803 Then
                Throw New Exception
            End If
            _cv.Dispose()
        Catch ex As Exception
            SupportedWinVersion = False
            Try
                _cv.Dispose()
            Catch ex2 As Exception
            End Try
            Dim res = MsgBox("This program has been made to run fine in Windows 10 1803 and newer versions. I'm not responsible for any damage or issues when running this on old Windows versions/builds." & Environment.NewLine & Environment.NewLine & "This version of Windows is not supported. Do you wish to continue anyway?", MsgBoxStyle.Critical Or MsgBoxStyle.YesNo, "Warning")
            If res = MsgBoxResult.No Then
                Environment.Exit(0)
            End If
        End Try
    End Sub

    Sub ShowLicense()
        If Not My.Computer.FileSystem.FileExists("eula.txt") OrElse Not My.Computer.FileSystem.ReadAllText("eula.txt").ToLower().Contains("accept=true") Then
            Dim res = MsgBox(My.Resources.MeUILicense, MsgBoxStyle.YesNo, "Warning")
            If res = MsgBoxResult.No Then
                Environment.Exit(0)
            Else
                Try
                    My.Computer.FileSystem.WriteAllText("eula.txt", "accept=true", False)
                Catch ex As Exception
                End Try
            End If
        End If
    End Sub
    Sub CheckSvcUI()
        Dim power_key = My.Computer.Registry.LocalMachine.OpenSubKey("SYSTEM\CurrentControlSet\Services\Power", True)
        Dim start_val As UInteger = power_key.GetValue("Start")
        If start_val > 3 Or start_val < 0 Then
            Dim res = MsgBox("Power Service is disabled. The software needs the Power Service to work. Do you wish my software to enable it and reboot your PC?", MsgBoxStyle.YesNo Or MsgBoxStyle.Exclamation, "Warning")
            If res = MsgBoxResult.Yes Then
                power_key.SetValue("Start", 2, Microsoft.Win32.RegistryValueKind.DWord)
                Process.Start("shutdown", "-r -t 0 -f")
            End If
            Environment.Exit(0)
        End If
        power_key.Dispose()
        power_key = Nothing
    End Sub

    Sub RunProcessWait(ByVal proc As String, Optional ByVal args As String = "", Optional ByVal ThrowOnError As Boolean = False, Optional ByVal ExceptionDescription As String = "powercfg failed")
        Dim p As New Process()
        p.StartInfo.FileName = proc
        p.StartInfo.UseShellExecute = False
        p.StartInfo.CreateNoWindow = True
        p.StartInfo.Arguments = args
        p.Start()
        While Not p.HasExited
            Threading.Thread.Sleep(1)
        End While
        If ThrowOnError AndAlso p.ExitCode <> 0 Then
            Throw New Exception(ExceptionDescription)
        End If
    End Sub

    Sub CheckPowerPlanExists()
        Dim pwr = My.Computer.Registry.LocalMachine.OpenSubKey("SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes", False)
        If Not pwr.GetSubKeyNames().Contains("23dc3dc2-9e1b-4954-a427-ca33c8333f77") Then
            pwr.Dispose()
            pwr = Nothing
            Throw New Exception("Failed to create system settings. This usually happens because of missing default power plans.")
        End If
        pwr.Dispose()
        pwr = Nothing
    End Sub

    Sub DisableLowLatency(Optional ByVal ThrowExceptions As Boolean = True)
        RunProcessWait("powercfg", "/setactive " & CurrentPowerPlan, ThrowExceptions, "Failed to disable Low Latency")
        DisableTimerRes()
    End Sub

    Sub EnableLowLatency()
        RunProcessWait("powercfg", "/setactive 23dc3dc2-9e1b-4954-a427-ca33c8333f77", True, "Failed to enable Low Latency")
        EnableTimerRes()
    End Sub

    Sub DisableAll(Optional ByVal ThrowExceptions As Boolean = False)
        If Not InitializedFine Then
            Exit Sub
        End If
        DisableLowLatency(ThrowExceptions)
        RunProcessWait("powercfg", "/delete 23dc3dc2-9e1b-4954-a427-ca33c8333f77", ThrowExceptions)
    End Sub

    Private Sub Form1_Closing(sender As Object, e As EventArgs) Handles MyBase.Closing
        DisableAll()
    End Sub

    Sub GetCurrentPowerPlan()
        Dim pp = My.Computer.Registry.LocalMachine.OpenSubKey("SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes", False)
        CurrentPowerPlan = pp.GetValue("ActivePowerScheme")
        pp.Dispose()
        pp = Nothing
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ShowLicense()
        CheckWin10()
        CheckSvcUI()
        Form2.Show()
        GetCurrentPowerPlan()
        RunProcessWait("net", "start power")
        If CurrentPowerPlan = "23dc3dc2-9e1b-4954-a427-ca33c8333f77" Then
            CurrentPowerPlan = "381b4222-f694-41f0-9685-ff5bb260df2e"
            RunProcessWait("powercfg", "/setactive 381b4222-f694-41f0-9685-ff5bb260df2e")
        End If
        RunProcessWait("powercfg", "/delete 23dc3dc2-9e1b-4954-a427-ca33c8333f77")
        RunProcessWait("powercfg", "/duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 23dc3dc2-9e1b-4954-a427-ca33c8333f77")
        Try
            CheckPowerPlanExists()
        Catch ex As Exception
            RunProcessWait("powercfg", "/duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 23dc3dc2-9e1b-4954-a427-ca33c8333f77")
            UltimatePerformanceExists = False
        End Try
        CheckPowerPlanExists()

        RunProcessWait("powercfg", "/changename 23dc3dc2-9e1b-4954-a427-ca33c8333f77 ""Melody Low Latency Power Plan"" ""Melody Low Latency Power Plan""")

        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 1")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 0012ee47-9041-4b5d-9b77-535fba8b1442 0b2d69d7-a2a1-449c-9680-f91c70521c60 0")

        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 0012ee47-9041-4b5d-9b77-535fba8b1442 dbc9e238-6de9-49e3-92cd-8c2b4946b472 1")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 0012ee47-9041-4b5d-9b77-535fba8b1442 fc95af4d-40e7-4b6d-835a-56d131dbc80e 1")

        ' === Core Unpark removed from the program - makes trouble on Ryzen

        'RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E 2BFC24F9-5EA2-4801-8213-3DBAE01AA39D 6")
        ' Interrupt Steering causes issues on both AMD Ryzen and Intel

        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E D6BA4903-386F-4c2c-8ADB-5C21B3328D25 1")
        RunProcessWait("powercfg", "/setacvalueindex 23dc3dc2-9e1b-4954-a427-ca33c8333f77 48672F38-7A9A-4bb2-8BF8-3D85BE19DE4E 73CDE64D-D720-4bb2-A860-C755AFE77EF2 10000")

        InitializedFine = True
        Label3.Text = Ver
        Me.Text &= " " & Ver

        NtQueryTimerResolution(MinimumTimerResolution, MaximumTimerResolution, LastRegisteredTimerResolution)

        Form2.Close()
    End Sub

    Sub TestTicks()
        If (Environment.TickCount - LastClickTick) < 2000 Then
            Throw New Exception
        End If
        LastClickTick = Environment.TickCount
    End Sub

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click
        Try
            TestTicks()
        Catch ex As Exception
            Exit Sub
        End Try
        If CurrentState = False Then
            PictureBox1.Image = My.Resources.LL_on
            CurrentState = True
            EnableLowLatency()
            Exit Sub
        End If
        CurrentState = False
        PictureBox1.Image = My.Resources.LL_off
        DisableLowLatency()
    End Sub

    Public BoolTextAssoc As New Dictionary(Of Boolean, String) From {
            {True, "YES"},
            {False, "NO"}
        }

    Function TimerResString(ByVal val As String) As String
        Return (val / 10) & " μs (" & (val / 10000) & " ms, " & ((1000 / (val / 10000)) / 1000).ToString("F2") & " KHz)"
    End Function

    Function CreateDebugText() As String
        Dim DebugText As String = "Version: " & Ver & Environment.NewLine
        DebugText &= "Windows Version: " & OS_Name & Environment.NewLine
        DebugText &= "Supported Windows Version: " & BoolTextAssoc(SupportedWinVersion) & Environment.NewLine
        DebugText &= "User's desired powerplan: " & CurrentPowerPlan & Environment.NewLine
        DebugText &= "UPERF Available: " & BoolTextAssoc(UltimatePerformanceExists) & Environment.NewLine
        DebugText &= "Initialized fine: " & BoolTextAssoc(InitializedFine) & Environment.NewLine
        DebugText &= "Low Latency Power Plan: 23dc3dc2-9e1b-4954-a427-ca33c8333f77" & Environment.NewLine
        DebugText &= "Low Latency Enabled: " & BoolTextAssoc(CurrentState) & Environment.NewLine
        Dim clicktickdiff = Environment.TickCount - LastClickTick
        Dim d As String = "(can't click)"
        If clicktickdiff >= 2000 Then
            d = "(can click)"
        End If
        DebugText &= "Last click tick diff: " & (Environment.TickCount - LastClickTick).ToString() & " ms " & d & Environment.NewLine
        Dim mbuf As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters", "MouseDataQueueSize", "N/A")
        Dim mbufint As UInteger
        Try
            mbufint = UInteger.Parse(mbuf)
            DebugText &= "Mouse Buffer: " & mbufint & " (" & mbufint * 24 & " bytes)" & Environment.NewLine
        Catch ex As Exception
            DebugText &= "Mouse Buffer: N/A" & Environment.NewLine
        End Try
        Dim kbuf As String = My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters", "KeyboardDataQueueSize", "N/A")
        Dim kbufint As UInteger
        Try
            kbufint = UInteger.Parse(kbuf)
            DebugText &= "Keyboard Buffer: " & kbufint & " (" & kbufint * 24 & " bytes)" & Environment.NewLine
        Catch ex As Exception
            DebugText &= "Keyboard Buffer: N/A" & Environment.NewLine
        End Try
        Dim min As UInteger
        Dim max As UInteger
        Dim cur As UInteger
        NtQueryTimerResolution(min, max, cur)
        DebugText &= "Current Timer Resolution: " & TimerResString(cur) & Environment.NewLine
        DebugText &= "Min Timer Resolution: " & TimerResString(min) & Environment.NewLine
        DebugText &= "Max Timer Resolution: " & TimerResString(max) & Environment.NewLine
        Return DebugText
    End Function

    Sub SetMouseBuffer()
        Dim st = New Form3
        st.TopMost = True
        st.Show()
        st.BringToFront()
        st.Select()
        Me.Enabled = False
        Me.Hide()
        Dim rg = My.Computer.Registry.LocalMachine.OpenSubKey("SYSTEM\CurrentControlSet\Services", False)
        Dim mouclass = rg.OpenSubKey("mouclass", True)
        Dim mouclass_parameters As Microsoft.Win32.RegistryKey
        If Not mouclass.GetSubKeyNames().Contains("Parameters", StringComparer.OrdinalIgnoreCase) Then
            mouclass_parameters = mouclass.CreateSubKey("Parameters", True)
        Else
            mouclass_parameters = mouclass.OpenSubKey("Parameters", True)
        End If
        mouclass_parameters.SetValue("MouseDataQueueSize", 16, Microsoft.Win32.RegistryValueKind.DWord)
        mouclass.Dispose()
        Dim kbdclass = rg.OpenSubKey("kbdclass", False)
        Dim kbdclass_parameters = kbdclass.OpenSubKey("Parameters", True)
        kbdclass_parameters.SetValue("KeyboardDataQueueSize", 16, Microsoft.Win32.RegistryValueKind.DWord)
        kbdclass.Dispose()
        rg.Dispose()
        RunProcessWait("bcdedit", "/set useplatformtick Yes")
        RunProcessWait("bcdedit", "/deletevalue useplatformclock")
        RunProcessWait("bcdedit", "/set tscsyncpolicy Enhanced")
        RunProcessWait("bcdedit", "/deletevalue disabledynamictick")
        st.Close()
        st.Dispose()
        MsgBox("Parameters have been set! Reboot your PC to make the changes effective", MsgBoxStyle.Information, "Low Latency Parameters")
        Me.Show()
        Me.Enabled = True
        Me.BringToFront()
        Me.Select()
    End Sub

    Sub EnableTimerRes()
        Timer_Res_Enabled = True
        NtSetTimerResolution(MaximumTimerResolution, True, LastRegisteredTimerResolution)
        PictureBox2.Image = My.Resources.LL_on
    End Sub

    Sub DisableTimerRes()
        Timer_Res_Enabled = False
        PictureBox2.Image = My.Resources.LL_off
        NtSetTimerResolution(MinimumTimerResolution, True, LastRegisteredTimerResolution)
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        If (Not My.Computer.Keyboard.CtrlKeyDown And Not My.Computer.Keyboard.ShiftKeyDown And Not My.Computer.Keyboard.AltKeyDown) Or Me.WindowState = FormWindowState.Minimized Then
            If ToolTip1.Active Then
                ToolTip1.Hide(PictureBox1)
                ToolTip1.RemoveAll()
                ToolTip1.Active = False
            End If
            Exit Sub
        End If
        If Not ToolTip1.Active Then
            ToolTip1.Active = True
        End If
        Timer1.Stop()
        Timer1.Enabled = False
        ToolTip1.Show(CreateDebugText(), PictureBox1)
        Timer1.Interval = 1000
        Timer1.Enabled = True
        Timer1.Start()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SetMouseBuffer()
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        Try
            TestTicks()
        Catch ex As Exception
            Exit Sub
        End Try
        If Timer_Res_Enabled Then
            DisableTimerRes()
            Exit Sub
        End If
        EnableTimerRes()
    End Sub

End Class
