[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

<#

.SYNOPSIS
This is a simple powershell winform for generating multiple port network switch configurations.

.DESCRIPTION
The form itself will only generate text the proper port numbers for the boxes selected. Generating then copies the entire textbox for pasting into a console or ssh.

.EXAMPLE
./PortConf.ps1

.NOTES
Be sure to change the interface selection to the correct syntax for the type of switches you use. This one is designed for HPE switches.
I created this at night outside of billable hours to use at work. 
Thank you to Bryan Hughes, who helped me with the interface checkbox logic selection. 

#>

#Logic

function clears {
    $txtToCopy.Clear()
}

function chk_port {

    if(($cboSwitchNum.SelectedIndex -eq -1) -or ($cboConversion.SelectedIndex -eq -1))
        {
            $StatusBar.Text = "Try Selecting a switch,conversion, and port number."
            [System.Windows.MessageBox]::Show("Select switch# or conversion.",'Choose Dropdowns','OK','Error')
    }
    else {
        
        foreach($item in $groupBox.Controls){
            if($item.CheckState -eq $true){
                $txtToCopy.AppendText("interface gigabit " + ($cboSwitchNum.SelectedIndex + 1) + "/0/" +$item.text ) #CHANGE HERE FOR TYPE OF SWITCH.
                $txtToCopy.AppendText($list.($cboConversion.SelectedItem) + "`n") 
                $item.Checked = $false #reset checkboxes.
                
            }
        }
    
    $txtToCopy.SelectAll() #select all and copy to clipboard. 
    $txtToCopy.Copy() 

    
    
    $StatusBar.Text = "Text Generated and copied to clipboard."
    
    
    }
}




# To find more Properties for GUI parts ($Form | get-member -MemberType Property,Method)

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Port Conversion Application"
$Form.TopMost = $true
$Form.Width = 1000
$Form.Height = 600
$Form.MaximizeBox = $false
$Form.StartPosition = "CenterScreen"
#$Form.FormBorderStyle = "Fixed3D" Ugly


$cboSwitchNum = New-Object System.Windows.Forms.ComboBox
$cboSwitchNum.Text = "Switch Stack #"
$cboSwitchNum.AutoSize = $true
$cboSwitchNum.Width = 120
$cboSwitchNum.Height = 50
$cboSwitchNum.Location = new-object system.drawing.point(30,20)
$cboSwitchNum.Font = "Microsoft Sans Serif,10"
$cboSwitchNum.Items.Add("Switch 1")
$cboSwitchNum.Items.Add("Switch 2")
$cboSwitchNum.Items.Add("Switch 3")
$cboSwitchNum.Items.Add("Switch 4")
$cboSwitchNum.Items.Add("Switch 5")
$cboSwitchNum.Items.Add("Switch 6")
$cboSwitchNum.Items.Add("Switch 7")
$cboSwitchNum.Items.Add("Switch 8")
$cboSwitchNum.Items.Add("Switch 9")
$Form.controls.Add($cboSwitchNum)

$cboConversion = New-Object System.Windows.Forms.ComboBox
$cboConversion.Text = "Port Type"
$cboConversion.AutoSize = $true
$cboConversion.Width = 200
$cboConversion.Height = 50
$cboConversion.Location = new-object system.drawing.point(350,20)
$cboConversion.Font = "Microsoft Sans Serif,10"
$cboConversion.ValueMember = "Value"
$cboConversion.DisplayMember = "Name"
# The list lets you define configuration options for each port conversion type.
$list = @{ "Option1" = "
port type
description option 1
other port configuration values
";
            "Option2" ="
port type
description option 2
other port configuration values
";
            "Option3" = "
port type
description option 3
other port configuration values
";

          }

$cboConversion.Items.AddRange($list.Keys);
#$cboConversion.Items.Add("DataVoice to AP")
#$cboConversion.Items.Add("AP to DataVoice")
#$cboConversion.Items.Add("Trunk to DataVoice")
#$cboConversion.Items.Add("DataVoice to Trunk")
$Form.controls.Add($cboConversion)


$groupBox = New-Object System.Windows.Forms.GroupBox #create the group box
$groupBox.Location = New-Object System.Drawing.Size(10,50) #location of the group box (px) in relation to the primary window's edges (length, height)
$groupBox.size = New-Object System.Drawing.Size(975,65) #the size in px of the group box (length, height)
$groupBox.text = "Ports" #labeling the box
$Form.Controls.Add($groupBox) #activate the group box

$chkBox1 = New-Object system.windows.Forms.CheckBox
$chkBox1.Text = "1"
$chkBox1.AutoSize = $true
$chkBox1.Width = 20
$chkBox1.Height = 20
$chkBox1.location = new-object system.drawing.point(10,20)
$chkBox1.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox1)

$chkBox2 = New-Object system.windows.Forms.CheckBox
$chkBox2.Text = "2"
$chkBox2.AutoSize = $true
$chkBox2.Width = 20
$chkBox2.Height = 20
$chkBox2.location = new-object system.drawing.point(10,40)
$chkBox2.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox2)

$chkBox3 = New-Object system.windows.Forms.CheckBox
$chkBox3.Text = "3"
$chkBox3.AutoSize = $true
$chkBox3.Width = 20
$chkBox3.Height = 20
$chkBox3.location = new-object system.drawing.point(50,20)
$chkBox3.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox3)

$chkBox4 = New-Object system.windows.Forms.CheckBox
$chkBox4.Text = "4"
$chkBox4.AutoSize = $true
$chkBox4.Width = 20
$chkBox4.Height = 20
$chkBox4.location = new-object system.drawing.point(50,40)
$chkBox4.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox4)

$chkBox5 = New-Object system.windows.Forms.CheckBox
$chkBox5.Text = "5"
$chkBox5.AutoSize = $true
$chkBox5.Width = 20
$chkBox5.Height = 20
$chkBox5.location = new-object system.drawing.point(90,20)
$chkBox5.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox5)

$chkBox6 = New-Object system.windows.Forms.CheckBox
$chkBox6.Text = "6"
$chkBox6.AutoSize = $true
$chkBox6.Width = 20
$chkBox6.Height = 20
$chkBox6.location = new-object system.drawing.point(90,40)
$chkBox6.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox6)

$chkBox7 = New-Object system.windows.Forms.CheckBox
$chkBox7.Text = "7"
$chkBox7.AutoSize = $true
$chkBox7.Width = 20
$chkBox7.Height = 20
$chkBox7.location = new-object system.drawing.point(130,20)
$chkBox7.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox7)

$chkBox8 = New-Object system.windows.Forms.CheckBox
$chkBox8.Text = "8"
$chkBox8.AutoSize = $true
$chkBox8.Width = 20
$chkBox8.Height = 20
$chkBox8.location = new-object system.drawing.point(130,40)
$chkBox8.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox8)

$chkBox9 = New-Object system.windows.Forms.CheckBox
$chkBox9.Text = "9"
$chkBox9.AutoSize = $true
$chkBox9.Width = 20
$chkBox9.Height = 20
$chkBox9.location = new-object system.drawing.point(170,20)
$chkBox9.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox9)

$chkBox10 = New-Object system.windows.Forms.CheckBox
$chkBox10.Text = "10"
$chkBox10.AutoSize = $true
$chkBox10.Width = 20
$chkBox10.Height = 20
$chkBox10.location = new-object system.drawing.point(170,40)
$chkBox10.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox10)


$chkbox11 = New-Object system.windows.Forms.CheckBox
$chkbox11.Text = "11"
$chkbox11.AutoSize = $true
$chkbox11.Width = 20
$chkbox11.Height = 20
$chkbox11.location = new-object system.drawing.point(210,20)
$chkbox11.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox11)

$chkbox12 = New-Object system.windows.Forms.CheckBox
$chkbox12.Text = "12"
$chkbox12.AutoSize = $true
$chkbox12.Width = 20
$chkbox12.Height = 20
$chkbox12.location = new-object system.drawing.point(210,40)
$chkbox12.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox12)

$chkbox13 = New-Object system.windows.Forms.CheckBox
$chkbox13.Text = "13"
$chkbox13.AutoSize = $true
$chkbox13.Width = 20
$chkbox13.Height = 20
$chkbox13.location = new-object system.drawing.point(250,20)
$chkbox13.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox13)

$chkbox14 = New-Object system.windows.Forms.CheckBox
$chkbox14.Text = "14"
$chkbox14.AutoSize = $true
$chkbox14.Width = 20
$chkbox14.Height = 20
$chkbox14.location = new-object system.drawing.point(250,40)
$chkbox14.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox14)

$chkbox15 = New-Object system.windows.Forms.CheckBox
$chkbox15.Text = "15"
$chkbox15.AutoSize = $true
$chkbox15.Width = 20
$chkbox15.Height = 20
$chkbox15.location = new-object system.drawing.point(290,20)
$chkbox15.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox15)

$chkbox16 = New-Object system.windows.Forms.CheckBox
$chkbox16.Text = "16"
$chkbox16.AutoSize = $true
$chkbox16.Width = 20
$chkbox16.Height = 20
$chkbox16.location = new-object system.drawing.point(290,40)
$chkbox16.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox16)

$chkbox17 = New-Object system.windows.Forms.CheckBox
$chkbox17.Text = "17"
$chkbox17.AutoSize = $true
$chkbox17.Width = 20
$chkbox17.Height = 20
$chkbox17.location = new-object system.drawing.point(330,20)
$chkbox17.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox17)

$chkbox18 = New-Object system.windows.Forms.CheckBox
$chkbox18.Text = "18"
$chkbox18.AutoSize = $true
$chkbox18.Width = 20
$chkbox18.Height = 20
$chkbox18.location = new-object system.drawing.point(330,40)
$chkbox18.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox18)

$chkbox19 = New-Object system.windows.Forms.CheckBox
$chkbox19.Text = "19"
$chkbox19.AutoSize = $true
$chkbox19.Width = 20
$chkbox19.Height = 20
$chkbox19.location = new-object system.drawing.point(370,20)
$chkbox19.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox19)

$chkbox20 = New-Object system.windows.Forms.CheckBox
$chkbox20.Text = "20"
$chkbox20.AutoSize = $true
$chkbox20.Width = 20
$chkbox20.Height = 20
$chkbox20.location = new-object system.drawing.point(370,40)
$chkbox20.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox20)

$chkbox21 = New-Object system.windows.Forms.CheckBox
$chkbox21.Text = "21"
$chkbox21.AutoSize = $true
$chkbox21.Width = 20
$chkbox21.Height = 20
$chkbox21.location = new-object system.drawing.point(410,20)
$chkbox21.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox21)

$chkbox22 = New-Object system.windows.Forms.CheckBox
$chkbox22.Text = "22"
$chkbox22.AutoSize = $true
$chkbox22.Width = 20
$chkbox22.Height = 20
$chkbox22.location = new-object system.drawing.point(410,40)
$chkbox22.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox22)

$chkbox23 = New-Object system.windows.Forms.CheckBox
$chkbox23.Text = "23"
$chkbox23.AutoSize = $true
$chkbox23.Width = 20
$chkbox23.Height = 20
$chkbox23.location = new-object system.drawing.point(450,20)
$chkbox23.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox23)

$chkbox24 = New-Object system.windows.Forms.CheckBox
$chkbox24.Text = "24"
$chkbox24.AutoSize = $true
$chkbox24.Width = 20
$chkbox24.Height = 20
$chkbox24.location = new-object system.drawing.point(450,40)
$chkbox24.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox24)

$chkbox25 = New-Object system.windows.Forms.CheckBox
$chkbox25.Text = "25"
$chkbox25.AutoSize = $true
$chkbox25.Width = 20
$chkbox25.Height = 20
$chkbox25.location = new-object system.drawing.point(490,20)
$chkbox25.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox25)

$chkbox26 = New-Object system.windows.Forms.CheckBox
$chkbox26.Text = "26"
$chkbox26.AutoSize = $true
$chkbox26.Width = 20
$chkbox26.Height = 20
$chkbox26.location = new-object system.drawing.point(490,40)
$chkbox26.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox26)

$chkbox27 = New-Object system.windows.Forms.CheckBox
$chkbox27.Text = "27"
$chkbox27.AutoSize = $true
$chkbox27.Width = 20
$chkbox27.Height = 20
$chkbox27.location = new-object system.drawing.point(530,20)
$chkbox27.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox27)

$chkbox28 = New-Object system.windows.Forms.CheckBox
$chkbox28.Text = "28"
$chkbox28.AutoSize = $true
$chkbox28.Width = 20
$chkbox28.Height = 20
$chkbox28.location = new-object system.drawing.point(530,40)
$chkbox28.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox28)

$chkbox29 = New-Object system.windows.Forms.CheckBox
$chkbox29.Text = "29"
$chkbox29.AutoSize = $true
$chkbox29.Width = 20
$chkbox29.Height = 20
$chkbox29.location = new-object system.drawing.point(570,20)
$chkbox29.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox29)

$chkbox30 = New-Object system.windows.Forms.CheckBox
$chkbox30.Text = "30"
$chkbox30.AutoSize = $true
$chkbox30.Width = 20
$chkbox30.Height = 20
$chkbox30.location = new-object system.drawing.point(570,40)
$chkbox30.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox30)

$chkbox31 = New-Object system.windows.Forms.CheckBox
$chkbox31.Text = "31"
$chkbox31.AutoSize = $true
$chkbox31.Width = 20
$chkbox31.Height = 20
$chkbox31.location = new-object system.drawing.point(610,20)
$chkbox31.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox31)

$chkbox32 = New-Object system.windows.Forms.CheckBox
$chkbox32.Text = "32"
$chkbox32.AutoSize = $true
$chkbox32.Width = 20
$chkbox32.Height = 20
$chkbox32.location = new-object system.drawing.point(610,40)
$chkbox32.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox32)

$chkbox33 = New-Object system.windows.Forms.CheckBox
$chkbox33.Text = "33"
$chkbox33.AutoSize = $true
$chkbox33.Width = 20
$chkbox33.Height = 20
$chkbox33.location = new-object system.drawing.point(650,20)
$chkbox33.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox33)

$chkbox34 = New-Object system.windows.Forms.CheckBox
$chkbox34.Text = "34"
$chkbox34.AutoSize = $true
$chkbox34.Width = 20
$chkbox34.Height = 20
$chkbox34.location = new-object system.drawing.point(650,40)
$chkbox34.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox34)

$chkbox35 = New-Object system.windows.Forms.CheckBox
$chkbox35.Text = "35"
$chkbox35.AutoSize = $true
$chkbox35.Width = 20
$chkbox35.Height = 20
$chkbox35.location = new-object system.drawing.point(690,20)
$chkbox35.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox35)

$chkbox36 = New-Object system.windows.Forms.CheckBox
$chkbox36.Text = "36"
$chkbox36.AutoSize = $true
$chkbox36.Width = 20
$chkbox36.Height = 20
$chkbox36.location = new-object system.drawing.point(690,40)
$chkbox36.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox36)

$chkbox37 = New-Object system.windows.Forms.CheckBox
$chkbox37.Text = "37"
$chkbox37.AutoSize = $true
$chkbox37.Width = 20
$chkbox37.Height = 20
$chkbox37.location = new-object system.drawing.point(730,20)
$chkbox37.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox37)

$chkbox38 = New-Object system.windows.Forms.CheckBox
$chkbox38.Text = "38"
$chkbox38.AutoSize = $true
$chkbox38.Width = 20
$chkbox38.Height = 20
$chkbox38.location = new-object system.drawing.point(730,40)
$chkbox38.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox38)

$chkbox39 = New-Object system.windows.Forms.CheckBox
$chkbox39.Text = "39"
$chkbox39.AutoSize = $true
$chkbox39.Width = 20
$chkbox39.Height = 20
$chkbox39.location = new-object system.drawing.point(770,20)
$chkbox39.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox39)

$chkbox40 = New-Object system.windows.Forms.CheckBox
$chkbox40.Text = "40"
$chkbox40.AutoSize = $true
$chkbox40.Width = 20
$chkbox40.Height = 20
$chkbox40.location = new-object system.drawing.point(770,40)
$chkbox40.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox40)

$chkbox41 = New-Object system.windows.Forms.CheckBox
$chkbox41.Text = "41"
$chkbox41.AutoSize = $true
$chkbox41.Width = 20
$chkbox41.Height = 20
$chkbox41.location = new-object system.drawing.point(810,20)
$chkbox41.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox41)

$chkbox42 = New-Object system.windows.Forms.CheckBox
$chkbox42.Text = "42"
$chkbox42.AutoSize = $true
$chkbox42.Width = 20
$chkbox42.Height = 20
$chkbox42.location = new-object system.drawing.point(810,40)
$chkbox42.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox42)

$chkbox43 = New-Object system.windows.Forms.CheckBox
$chkbox43.Text = "43"
$chkbox43.AutoSize = $true
$chkbox43.Width = 20
$chkbox43.Height = 20
$chkbox43.location = new-object system.drawing.point(850,20)
$chkbox43.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox43)

$chkbox44 = New-Object system.windows.Forms.CheckBox
$chkbox44.Text = "44"
$chkbox44.AutoSize = $true
$chkbox44.Width = 20
$chkbox44.Height = 20
$chkbox44.location = new-object system.drawing.point(850,40)
$chkbox44.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox44)

$chkbox45 = New-Object system.windows.Forms.CheckBox
$chkbox45.Text = "45"
$chkbox45.AutoSize = $true
$chkbox45.Width = 20
$chkbox45.Height = 20
$chkbox45.location = new-object system.drawing.point(890,20)
$chkbox45.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox45)

$chkbox46 = New-Object system.windows.Forms.CheckBox
$chkbox46.Text = "46"
$chkbox46.AutoSize = $true
$chkbox46.Width = 20
$chkbox46.Height = 20
$chkbox46.location = new-object system.drawing.point(890,40)
$chkbox46.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox46)

$chkbox47 = New-Object system.windows.Forms.CheckBox
$chkbox47.Text = "47"
$chkbox47.AutoSize = $true
$chkbox47.Width = 20
$chkbox47.Height = 20
$chkbox47.location = new-object system.drawing.point(930,20)
$chkbox47.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox47)

$chkbox48 = New-Object system.windows.Forms.CheckBox
$chkbox48.Text = "48"
$chkbox48.AutoSize = $true
$chkbox48.Width = 20
$chkbox48.Height = 20
$chkbox48.location = new-object system.drawing.point(930,40)
$chkbox48.Font = "Microsoft Sans Serif,10"
$groupBox.Controls.Add($chkbox48)


$btnGen = New-Object System.Windows.Forms.Button
$btnGen.Text = "Generate and Copy"
$btnGen.AutoSize = $true
$btnGen.Width = 50
$btnGen.Height = 20
$btnGen.Location = New-Object System.Drawing.Point(760,20)
$btnGen.Font = "Microsoft Sans Serif,10"
$btnGen.Add_Click({chk_port})
$Form.Controls.Add($btnGen)

$btnClear = New-Object System.Windows.Forms.Button
$btnClear.Text = "Clear"
$btnClear.AutoSize = $true
$btnClear.Width = 50
$btnClear.Height = 20
$btnClear.Location = New-Object System.Drawing.Point(920,20)
$btnClear.Font = "Microsoft Sans Serif,10"
$btnClear.Add_Click({clears})
$Form.Controls.Add($btnClear)

$txtToCopy = New-Object System.Windows.Forms.TextBox
$txtToCopy.Text = ""
$txtToCopy.Multiline = $true
$txtToCopy.ScrollBars = 'both'
$txtToCopy.AcceptsReturn = $true
$txtToCopy.AcceptsTab = $true
$txtToCopy.BackColor = [Drawing.Color]::Black
$txtToCopy.ForeColor = [Drawing.Color]::LawnGreen
$txtToCopy.Size = New-Object System.Drawing.Size(930,420)
$txtToCopy.Location = New-Object System.Drawing.Point(30,120)
$Form.Controls.Add($txtToCopy)

$StatusBar = New-Object System.Windows.Forms.StatusBar
$StatusBar.Text = "Stop thinking so hard."
$StatusBar.Height = 22
$StatusBar.Width = 200
$StatusBar.Location = New-Object System.Drawing.Point(0,250)
$Form.Controls.Add($StatusBar)

[void]$Form.ShowDialog()
$Form.Dispose()