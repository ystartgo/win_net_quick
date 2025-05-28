# 版權所有 (C) 2025 startgo (startgo@yia.app)
# 根據 GNU GPL-3.0 授權發布
# 注意：任何對此程式的修改必須同樣以 GPL-3.0 授權發布
# 本程式可免費使用於任何環境，包括商業用途

# 確保正確的字元編碼
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows 11 網路設定工具"
$form.Size = New-Object System.Drawing.Size(500, 640)  # 增加視窗寬度以容納日文文字
$form.StartPosition = "CenterScreen"
# 指定支援多語言的字體
$form.Font = New-Object System.Drawing.Font("Meiryo UI", 9)  # 使用支援日文的字體

# 命令提示字元按鈕
$cmdButton = New-Object System.Windows.Forms.Button
$cmdButton.Location = New-Object System.Drawing.Point(50, 50)
$cmdButton.Size = New-Object System.Drawing.Size(390, 30)  # 增加按鈕寬度
$cmdButton.Text = "開啟命令提示字元"
$cmdButton.Add_Click({
    Start-Process "cmd.exe"
})
$form.Controls.Add($cmdButton)

# 網路設定按鈕
$networkButton = New-Object System.Windows.Forms.Button
$networkButton.Location = New-Object System.Drawing.Point(50, 100)
$networkButton.Size = New-Object System.Drawing.Size(390, 30)  # 增加按鈕寬度
$networkButton.Text = "開啟傳統網路設定"
$networkButton.Add_Click({
    Start-Process "ncpa.cpl"
})
$form.Controls.Add($networkButton)

# 控制台按鈕
$controlPanelButton = New-Object System.Windows.Forms.Button
$controlPanelButton.Location = New-Object System.Drawing.Point(50, 150)
$controlPanelButton.Size = New-Object System.Drawing.Size(390, 30)  # 增加按鈕寬度
$controlPanelButton.Text = "開啟控制台"
$controlPanelButton.Add_Click({
    Start-Process "control.exe"
})
$form.Controls.Add($controlPanelButton)

# 防火牆狀態標籤
$firewallLabel = New-Object System.Windows.Forms.Label
$firewallLabel.Location = New-Object System.Drawing.Point(50, 200)
$firewallLabel.Size = New-Object System.Drawing.Size(150, 22)  # 減少寬度以容納兩個按鈕
$firewallLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$form.Controls.Add($firewallLabel)

# 防火牆設定按鈕
$firewallButton = New-Object System.Windows.Forms.Button
$firewallButton.Location = New-Object System.Drawing.Point(210, 200)  # 調整位置
$firewallButton.Size = New-Object System.Drawing.Size(110, 22)  # 調整大小
$firewallButton.Text = "防火牆設定"
$firewallButton.Add_Click({
    Start-Process "firewall.cpl"
})
$form.Controls.Add($firewallButton)

# 防火牆與網路保護按鈕
$firewallAdvancedButton = New-Object System.Windows.Forms.Button
$firewallAdvancedButton.Location = New-Object System.Drawing.Point(330, 200)  # 位於防火牆設定按鈕旁邊
$firewallAdvancedButton.Size = New-Object System.Drawing.Size(110, 22)  # 與防火牆設定按鈕相同大小
$firewallAdvancedButton.Text = "網路保護"
$firewallAdvancedButton.Add_Click({
    # 開啟 Windows 安全性中心的防火牆與網路保護頁面
    Start-Process "windowsdefender://network/"
})
$form.Controls.Add($firewallAdvancedButton)

# 系統資訊區塊
$systemInfoGroupBox = New-Object System.Windows.Forms.GroupBox
$systemInfoGroupBox.Location = New-Object System.Drawing.Point(50, 230)
$systemInfoGroupBox.Size = New-Object System.Drawing.Size(390, 130)  # 增加寬度以容納日文文字
$systemInfoGroupBox.Text = "系統資訊"
$form.Controls.Add($systemInfoGroupBox)

# 作業系統版本標籤
$osVersionLabel = New-Object System.Windows.Forms.Label
$osVersionLabel.Location = New-Object System.Drawing.Point(10, 20)
$osVersionLabel.Size = New-Object System.Drawing.Size(370, 20)  # 增加寬度
$osVersionLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$systemInfoGroupBox.Controls.Add($osVersionLabel)

# CPU資訊標籤
$cpuInfoLabel = New-Object System.Windows.Forms.Label
$cpuInfoLabel.Location = New-Object System.Drawing.Point(10, 40)
$cpuInfoLabel.Size = New-Object System.Drawing.Size(370, 20)  # 增加寬度
$cpuInfoLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$systemInfoGroupBox.Controls.Add($cpuInfoLabel)

# 記憶體資訊標籤
$memoryInfoLabel = New-Object System.Windows.Forms.Label
$memoryInfoLabel.Location = New-Object System.Drawing.Point(10, 60)
$memoryInfoLabel.Size = New-Object System.Drawing.Size(370, 20)  # 增加寬度
$memoryInfoLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$systemInfoGroupBox.Controls.Add($memoryInfoLabel)

# 顯示卡資訊標籤
$gpuInfoLabel = New-Object System.Windows.Forms.Label
$gpuInfoLabel.Location = New-Object System.Drawing.Point(10, 80)
$gpuInfoLabel.Size = New-Object System.Drawing.Size(370, 20)  # 增加寬度
$gpuInfoLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$systemInfoGroupBox.Controls.Add($gpuInfoLabel)

# 系統資訊按鈕
$systemInfoButton = New-Object System.Windows.Forms.Button
$systemInfoButton.Location = New-Object System.Drawing.Point(10, 100)
$systemInfoButton.Size = New-Object System.Drawing.Size(370, 20)  # 增加寬度
$systemInfoButton.Text = "開啟系統資訊"
$systemInfoButton.Add_Click({
    Start-Process "msinfo32.exe"
})
$systemInfoGroupBox.Controls.Add($systemInfoButton)

# 翻譯 Windows 版本名稱的函數
function Translate-WindowsEdition {
    param (
        [string]$OriginalName,
        [string]$Language
    )
    
    # 建立翻譯對照表
    $translations = @{
        "繁體中文" = @{
            "Professional" = "專業版";
            "Home" = "家用版";
            "Enterprise" = "企業版";
            "Education" = "教育版";
            "Pro" = "專業版";
            "Pro for Workstations" = "工作站專業版";
            "S" = "S 模式";
            "IoT Enterprise" = "IoT 企業版";
            "Server" = "伺服器";
        };
        "English" = @{
            "專業版" = "Professional";
            "家用版" = "Home";
            "企業版" = "Enterprise";
            "教育版" = "Education";
            "工作站專業版" = "Pro for Workstations";
            "S 模式" = "S Mode";
            "IoT 企業版" = "IoT Enterprise";
            "伺服器" = "Server";
        };
        "日本語" = @{
            "Professional" = "プロフェッショナル";
            "Home" = "ホーム";
            "Enterprise" = "エンタープライズ";
            "Education" = "エデュケーション";
            "Pro" = "プロ";
            "Pro for Workstations" = "Pro for Workstations";
            "S" = "S モード";
            "IoT Enterprise" = "IoT エンタープライズ";
            "Server" = "サーバー";
            "專業版" = "プロフェッショナル";
            "家用版" = "ホーム";
            "企業版" = "エンタープライズ";
            "教育版" = "エデュケーション";
            "工作站專業版" = "Pro for Workstations";
            "S 模式" = "S モード";
            "IoT 企業版" = "IoT エンタープライズ";
            "伺服器" = "サーバー";
        }
    }
    
    # 檢查是否有對應的翻譯
    if ($Language -ne "繁體中文" -and $translations.ContainsKey($Language)) {
        foreach ($key in $translations[$Language].Keys) {
            if ($OriginalName -match $key) {
                return $OriginalName -replace $key, $translations[$Language][$key]
            }
        }
    }
    
    # 如果沒有找到對應的翻譯，返回原始名稱
    return $OriginalName
}

# 縮短長文字的函數，用於防止日文文字被裁切
function Truncate-Text {
    param (
        [string]$Text,
        [int]$MaxLength = 40
    )
    
    if ($Text.Length -gt $MaxLength) {
        return $Text.Substring(0, $MaxLength - 3) + "..."
    }
    
    return $Text
}

# 取得系統資訊的函數
function Get-SystemInfo {
    param (
        [string]$Language
    )

    try {
        # 取得作業系統資訊
        $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
        $osVersion = $osInfo.Caption
        $osBuild = $osInfo.Version
        
        # 根據語言翻譯 OS 版本名稱
        $translatedOsVersion = Translate-WindowsEdition -OriginalName $osVersion -Language $Language
        
        # 取得CPU資訊
        $cpuInfo = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1
        $cpuName = $cpuInfo.Name
        
        # 縮短CPU名稱以避免日文顯示問題
        $truncatedCpuName = Truncate-Text -Text $cpuName -MaxLength 40
        
        # 取得記憶體資訊
        $totalMemoryGB = [math]::Round($osInfo.TotalVisibleMemorySize / 1MB, 1)
        $freeMemoryGB = [math]::Round($osInfo.FreePhysicalMemory / 1MB, 1)
        
        # 取得顯示卡資訊
        $gpuInfo = Get-CimInstance -ClassName Win32_VideoController | Select-Object -First 1
        $gpuName = $gpuInfo.Name
        
        # 縮短顯示卡名稱以避免日文顯示問題
        $truncatedGpuName = Truncate-Text -Text $gpuName -MaxLength 40
        
        # 根據語言設定顯示文字
        switch ($Language) {
            "繁體中文" {
                $osVersionLabel.Text = "作業系統: $translatedOsVersion ($osBuild)"
                $cpuInfoLabel.Text = "處理器: $truncatedCpuName"
                $memoryInfoLabel.Text = "記憶體: $totalMemoryGB GB (可用: $freeMemoryGB GB)"
                $gpuInfoLabel.Text = "顯示卡: $truncatedGpuName"
                $systemInfoButton.Text = "開啟系統資訊"
                $systemInfoGroupBox.Text = "系統資訊"
            }
            "English" {
                $osVersionLabel.Text = "OS: $translatedOsVersion ($osBuild)"
                $cpuInfoLabel.Text = "CPU: $truncatedCpuName"
                $memoryInfoLabel.Text = "Memory: $totalMemoryGB GB (Free: $freeMemoryGB GB)"
                $gpuInfoLabel.Text = "GPU: $truncatedGpuName"
                $systemInfoButton.Text = "Open System Information"
                $systemInfoGroupBox.Text = "System Information"
            }
            "日本語" {
                # 日文版本使用更簡短的格式以避免裁切
                $osVersionLabel.Text = "OS: $translatedOsVersion ($osBuild)"
                $cpuInfoLabel.Text = "CPU: $truncatedCpuName"
                $memoryInfoLabel.Text = "メモリ: $totalMemoryGB GB (利用可能: $freeMemoryGB GB)"
                $gpuInfoLabel.Text = "GPU: $truncatedGpuName"
                $systemInfoButton.Text = "システム情報"
                $systemInfoGroupBox.Text = "システム情報"
            }
            default {
                $osVersionLabel.Text = "作業系統: $translatedOsVersion ($osBuild)"
                $cpuInfoLabel.Text = "處理器: $truncatedCpuName"
                $memoryInfoLabel.Text = "記憶體: $totalMemoryGB GB (可用: $freeMemoryGB GB)"
                $gpuInfoLabel.Text = "顯示卡: $truncatedGpuName"
                $systemInfoButton.Text = "開啟系統資訊"
                $systemInfoGroupBox.Text = "系統資訊"
            }
        }
    }
    catch {
        switch ($Language) {
            "繁體中文" {
                $osVersionLabel.Text = "作業系統: 無法取得資訊"
                $cpuInfoLabel.Text = "處理器: 無法取得資訊"
                $memoryInfoLabel.Text = "記憶體: 無法取得資訊"
                $gpuInfoLabel.Text = "顯示卡: 無法取得資訊"
            }
            "English" {
                $osVersionLabel.Text = "OS: Unable to retrieve information"
                $cpuInfoLabel.Text = "CPU: Unable to retrieve information"
                $memoryInfoLabel.Text = "Memory: Unable to retrieve information"
                $gpuInfoLabel.Text = "GPU: Unable to retrieve information"
            }
            "日本語" {
                $osVersionLabel.Text = "OS: 情報を取得できません"
                $cpuInfoLabel.Text = "CPU: 情報を取得できません"
                $memoryInfoLabel.Text = "メモリ: 情報を取得できません"
                $gpuInfoLabel.Text = "GPU: 情報を取得できません"
            }
            default {
                $osVersionLabel.Text = "作業系統: 無法取得資訊"
                $cpuInfoLabel.Text = "處理器: 無法取得資訊"
                $memoryInfoLabel.Text = "記憶體: 無法取得資訊"
                $gpuInfoLabel.Text = "顯示卡: 無法取得資訊"
            }
        }
    }
}

# 檢查防火牆狀態的函數
function Get-FirewallStatus {
    param (
        [string]$Language
    )
    
    try {
        $firewallStatus = Get-NetFirewallProfile -Profile Domain,Public,Private | Select-Object -ExpandProperty Enabled
        $allEnabled = ($firewallStatus -notcontains $false)
        
        switch ($Language) {
            "繁體中文" {
                if ($allEnabled) {
                    return "防火牆：已啟用"
                } else {
                    return "防火牆：部分停用"
                }
            }
            "English" {
                if ($allEnabled) {
                    return "Firewall: Enabled"
                } else {
                    return "Firewall: Partially Disabled"
                }
            }
            "日本語" {
                if ($allEnabled) {
                    return "FW：有効"
                } else {
                    return "FW：無効"
                }
            }
            default {
                if ($allEnabled) {
                    return "防火牆：已啟用"
                } else {
                    return "防火牆：部分停用"
                }
            }
        }
    }
    catch {
        switch ($Language) {
            "繁體中文" { return "防火牆：無法取得" }
            "English" { return "Firewall: Unknown" }
            "日本語" { return "FW：不明" }
            default { return "防火牆：無法取得" }
        }
    }
}

# 更新防火牆狀態的函數
function Update-FirewallStatus {
    $selectedLanguage = $languageComboBox.SelectedItem
    $firewallLabel.Text = Get-FirewallStatus -Language $selectedLanguage
    
    # 根據防火牆狀態設定文字顏色
    if ($firewallLabel.Text.Contains("已啟用") -or $firewallLabel.Text.Contains("Enabled") -or $firewallLabel.Text.Contains("有効")) {
        $firewallLabel.ForeColor = [System.Drawing.Color]::Green
    } else {
        $firewallLabel.ForeColor = [System.Drawing.Color]::Red
    }
    
    # 更新防火牆按鈕文字
    switch ($selectedLanguage) {
        "繁體中文" { 
            $firewallButton.Text = "防火牆設定"
            $firewallAdvancedButton.Text = "網路保護"
        }
        "English" { 
            $firewallButton.Text = "Firewall"
            $firewallAdvancedButton.Text = "Network Security"
        }
        "日本語" { 
            $firewallButton.Text = "FW設定"
            $firewallAdvancedButton.Text = "ネット保護"
        }
        default { 
            $firewallButton.Text = "防火牆設定"
            $firewallAdvancedButton.Text = "網路保護"
        }
    }
}

# 語言切換下拉選單
$languageLabel = New-Object System.Windows.Forms.Label
$languageLabel.Location = New-Object System.Drawing.Point(50, 360)
$languageLabel.Size = New-Object System.Drawing.Size(100, 20)
$languageLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$languageLabel.Text = "語言(Lang)："
$form.Controls.Add($languageLabel)

$languageComboBox = New-Object System.Windows.Forms.ComboBox
$languageComboBox.Location = New-Object System.Drawing.Point(150, 360)
$languageComboBox.Size = New-Object System.Drawing.Size(240, 20)  # 增加下拉框寬度
$languageComboBox.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
[void]$languageComboBox.Items.Add("繁體中文")
[void]$languageComboBox.Items.Add("English")
[void]$languageComboBox.Items.Add("日本語")
$languageComboBox.SelectedIndex = 0
$form.Controls.Add($languageComboBox)

# 時間顯示標籤
$timeLabel = New-Object System.Windows.Forms.Label
$timeLabel.Location = New-Object System.Drawing.Point(50, 390)
$timeLabel.Size = New-Object System.Drawing.Size(390, 20)  # 增加寬度
$timeLabel.Text = "現在時間：" + (Get-Date -Format "yyyy/MM/dd HH:mm:ss")
$timeLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($timeLabel)

# 版權資訊
$copyrightLabel = New-Object System.Windows.Forms.Label
$copyrightLabel.Location = New-Object System.Drawing.Point(50, 420)
$copyrightLabel.Size = New-Object System.Drawing.Size(390, 20)  # 增加標籤寬度
$copyrightLabel.Text = "2025"
$copyrightLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($copyrightLabel)

# 授權資訊 - 分成兩行顯示
$licenseLabel1 = New-Object System.Windows.Forms.Label
$licenseLabel1.Location = New-Object System.Drawing.Point(50, 450)
$licenseLabel1.Size = New-Object System.Drawing.Size(390, 20)  # 增加標籤寬度
$licenseLabel1.Text = "根據 GNU GPL-3.0 授權發布"
$licenseLabel1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($licenseLabel1)

$licenseLabel2 = New-Object System.Windows.Forms.Label
$licenseLabel2.Location = New-Object System.Drawing.Point(50, 470)
$licenseLabel2.Size = New-Object System.Drawing.Size(390, 20)  # 增加標籤寬度
$licenseLabel2.Text = "可免費商用"
$licenseLabel2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($licenseLabel2)

# 使用環境宣告
$usageLabel = New-Object System.Windows.Forms.Label
$usageLabel.Location = New-Object System.Drawing.Point(50, 500)
$usageLabel.Size = New-Object System.Drawing.Size(390, 20)  # 增加標籤寬度
$usageLabel.Text = "可用於任何環境，包括商業用途"
$usageLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($usageLabel)

# 版本標籤
$versionLabel = New-Object System.Windows.Forms.Label
$versionLabel.Location = New-Object System.Drawing.Point(50, 520)
$versionLabel.Size = New-Object System.Drawing.Size(390, 20)  # 增加寬度
$versionLabel.Text = "版本 1.0.0"
$versionLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($versionLabel)

# 授權資訊按鈕
$licenseButton = New-Object System.Windows.Forms.Button
$licenseButton.Location = New-Object System.Drawing.Point(50, 540)
$licenseButton.Size = New-Object System.Drawing.Size(390, 30)  # 增加按鈕寬度
$licenseButton.Text = "授權資訊"
$licenseButton.Add_Click({
    $licenseTexts = @{
        "繁體中文" = @"
GNU 通用公共授權條款 (GPL-3.0)
版本 3, 2007年6月29日

版權所有 (C) 2025 startgo (startgo@yia.app)

重要聲明：
1. 本程式是自由軟體，您可以自由使用、修改和重新發布。
2. 任何對此程式的修改必須同樣以 GPL-3.0 授權發布。
3. 修改後的版本必須明確標示已被修改，以及修改日期。
4. 修改後的版本必須保留原始版權聲明。
5. 本程式可免費使用於任何環境，包括商業用途。

使用環境說明：
- 個人使用：完全免費
- 商業使用：完全免費，無需支付授權費
- 教育機構：完全免費
- 政府機關：完全免費

本程式是基於使用目的而加以發布，然而不負任何擔保責任；
亦無對適售性或特定目的適用性所為的默示性擔保。
詳情請參照 GNU 通用公共授權。

完整授權條款請訪問：https://www.gnu.org/licenses/gpl-3.0.html
"@

        "English" = @"
GNU GENERAL PUBLIC LICENSE (GPL-3.0)
Version 3, 29 June 2007

Copyright (C) 2025 startgo (startgo@yia.app)

IMPORTANT NOTICE:
1. This program is free software; you can use, modify, and redistribute it.
2. Any modifications to this program must also be released under the GPL-3.0 license.
3. Modified versions must clearly indicate that they have been modified and the date of modification.
4. Modified versions must preserve the original copyright notice.
5. This program can be used free of charge in any environment, including commercial use.

Usage Environment Statement:
- Personal use: Completely free
- Commercial use: Completely free, no license fee required
- Educational institutions: Completely free
- Government agencies: Completely free

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

For the complete license terms, visit: https://www.gnu.org/licenses/gpl-3.0.html
"@

        "日本語" = @"
GNU 一般公衆利用許諾書 (GPL-3.0)
バージョン 3, 2007年6月29日

著作権 (C) 2025 startgo (startgo@yia.app)

重要な通知：
1. このプログラムはフリーソフトウェアです。自由に使用、修正、再配布することができます。
2. このプログラムへの修正も、GPL-3.0ライセンスで公開する必要があります。
3. 修正されたバージョンは、修正されたことと修正日を明示する必要があります。
4. 修正されたバージョンは、元の著作権表示を保持する必要があります。
5. このプログラムは商用利用を含むあらゆる環境で無料で使用できます。

使用環境声明：
- 個人使用：完全無料
- 商用利用：完全無料、ライセンス料不要
- 教育機関：完全無料
- 政府機関：完全無料

このプログラムは有用であることを願って配布されていますが、
いかなる保証もありません。商品性や特定目的への適合性についての暗黙の保証もありません。
詳細については、GNU 一般公衆利用許諾書をご覧ください。

完全なライセンス条項：https://www.gnu.org/licenses/gpl-3.0.html
"@
    }
    
    $selectedLanguage = $languageComboBox.SelectedItem
    
    # 顯示授權資訊對話框
    [System.Windows.Forms.MessageBox]::Show($licenseTexts[$selectedLanguage], "授權資訊", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})
$form.Controls.Add($licenseButton)

# 建立計時器以更新時間和防火牆狀態
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000  # 每秒更新一次
$timer.Add_Tick({
    $currentTime = Get-Date
    
    $selectedLanguage = $languageComboBox.SelectedItem
    switch ($selectedLanguage) {
        "繁體中文" { $timeLabel.Text = "現在時間：" + $currentTime.ToString("yyyy/MM/dd HH:mm:ss") }
        "English" { $timeLabel.Text = "Current Time: " + $currentTime.ToString("yyyy/MM/dd HH:mm:ss") }
        "日本語" { $timeLabel.Text = "現在時刻：" + $currentTime.ToString("yyyy/MM/dd HH:mm:ss") }
    }
    
    # 每10秒更新一次防火牆狀態 (減少系統資源使用)
    if (($script:tickCount % 10) -eq 0) {
        Update-FirewallStatus
    }
    
    # 每60秒更新一次系統資訊 (減少系統資源使用)
    if (($script:tickCount % 60) -eq 0) {
        Get-SystemInfo -Language $selectedLanguage
    }
    
    $script:tickCount++
})
# 初始化計數器
$script:tickCount = 0
$timer.Start()

# 初始更新防火牆狀態和系統資訊
Update-FirewallStatus
Get-SystemInfo -Language "繁體中文"

$languageComboBox.Add_SelectedIndexChanged({
    $selectedLanguage = $languageComboBox.SelectedItem
    
    switch ($selectedLanguage) {
        "繁體中文" {
            $form.Text = "Windows 11 網路設定工具"
            $cmdButton.Text = "開啟命令提示字元"
            $networkButton.Text = "開啟傳統網路設定"
            $controlPanelButton.Text = "開啟控制台"
            $firewallButton.Text = "防火牆設定"
            $firewallAdvancedButton.Text = "網路保護"
            $languageLabel.Text = "語言(Lang)："
            $timeLabel.Text = "現在時間：" + (Get-Date -Format "yyyy/MM/dd HH:mm:ss")
            $copyrightLabel.Text = "2025"
            $licenseLabel1.Text = "根據 GNU GPL-3.0 授權發布"
            $licenseLabel2.Text = "可免費商用"
            $licenseButton.Text = "授權資訊"
            $versionLabel.Text = "版本 1.0.0"
            $usageLabel.Text = "可用於任何環境，包括商業用途"
        }
        "English" {
            $form.Text = "Windows 11 Network Configuration Tool"
            $cmdButton.Text = "Open Command Prompt"
            $networkButton.Text = "Open Network Settings"
            $controlPanelButton.Text = "Open Control Panel"
            $firewallButton.Text = "Firewall"
            $firewallAdvancedButton.Text = "Network Security"
            $languageLabel.Text = "Language(語言):"
            $timeLabel.Text = "Current Time: " + (Get-Date -Format "yyyy/MM/dd HH:mm:ss")
            $copyrightLabel.Text = "2025"
            $licenseLabel1.Text = "Released under GNU GPL-3.0 License"
            $licenseLabel2.Text = "Free for Commercial Use"
            $licenseButton.Text = "License Info"
            $versionLabel.Text = "Version 1.0.0"
            $usageLabel.Text = "Can be used in any environment, including commercial use"
        }
        "日本語" {
            $form.Text = "Windows 11 ネットワーク設定ツール"
            $cmdButton.Text = "コマンドプロンプト"
            $networkButton.Text = "ネットワーク設定"
            $controlPanelButton.Text = "コントロールパネル"
            $firewallButton.Text = "FW設定"
            $firewallAdvancedButton.Text = "ネット保護"
            $languageLabel.Text = "言語(Lang)："
            $timeLabel.Text = "現在時刻：" + (Get-Date -Format "yyyy/MM/dd HH:mm:ss")
            $copyrightLabel.Text = "2025"
            $licenseLabel1.Text = "GNU GPL-3.0 ライセンスで公開"
            $licenseLabel2.Text = "商用利用無料"
            $licenseButton.Text = "ライセンス情報"
            $versionLabel.Text = "バージョン 1.0.0"
            $usageLabel.Text = "商用利用を含むあらゆる環境で使用可能"
        }
    }
    
    # 更新防火牆狀態和系統資訊
    Update-FirewallStatus
    Get-SystemInfo -Language $selectedLanguage
})




# 顯示表單
$form.ShowDialog()
