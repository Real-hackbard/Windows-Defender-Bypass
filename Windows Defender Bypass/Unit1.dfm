object Form1: TForm1
  Left = 226
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Windows Defender Bypass v0.75 :'
  ClientHeight = 588
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 98
    Width = 21
    Height = 13
    Caption = 'OS :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 24
    Top = 114
    Width = 66
    Height = 13
    Caption = 'Current Build :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 13
    Top = 130
    Width = 78
    Height = 13
    Caption = 'Display Version :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 13
    Top = 146
    Width = 78
    Height = 13
    Caption = 'Current Version :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 35
    Top = 162
    Width = 56
    Height = 13
    Caption = 'ReleaseID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 97
    Top = 98
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 97
    Top = 114
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 97
    Top = 130
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 97
    Top = 146
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 97
    Top = 162
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label13: TLabel
    Left = 40
    Top = 178
    Width = 50
    Height = 13
    Caption = 'Build Lab :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label14: TLabel
    Left = 28
    Top = 194
    Width = 62
    Height = 13
    Caption = 'Build LabEx :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
  end
  object Label15: TLabel
    Left = 97
    Top = 178
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object Label16: TLabel
    Left = 97
    Top = 194
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object Label17: TLabel
    Left = 63
    Top = 210
    Width = 31
    Height = 13
    Caption = 'User : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 97
    Top = 210
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 42
    Top = 225
    Width = 49
    Height = 13
    Caption = 'EditionID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label20: TLabel
    Left = 98
    Top = 225
    Width = 17
    Height = 13
    Caption = 'n/a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object Label22: TLabel
    Left = 272
    Top = 476
    Width = 81
    Height = 13
    Caption = 'Registry Jumper :'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 85
    Align = alTop
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 446
    object Label11: TLabel
      Left = 93
      Top = 46
      Width = 38
      Height = 13
      Caption = 'Label11'
    end
    object Label12: TLabel
      Left = 93
      Top = 62
      Width = 38
      Height = 13
      Caption = 'Label12'
    end
    object Label21: TLabel
      Left = 14
      Top = 7
      Width = 347
      Height = 39
      Caption = 'Windows Defender Bypass'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 389
      Top = 12
      Width = 57
      Height = 65
      TabOrder = 0
      object Image3: TImage
        Left = 4
        Top = 6
        Width = 49
        Height = 54
        Stretch = True
        Transparent = True
      end
    end
    object Memo1: TMemo
      Left = 480
      Top = 12
      Width = 81
      Height = 48
      TabStop = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 317
    Top = 91
    Width = 125
    Height = 84
    Caption = ' OS '
    Items.Strings = (
      'Windows 10'
      'Windows 11'
      'Windows Server')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object RadioButton1: TRadioButton
    Left = 13
    Top = 264
    Width = 169
    Height = 17
    Caption = 'Deactivate Windows Defender'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 253
    Top = 264
    Width = 193
    Height = 17
    Caption = 'Activate Windows Defender'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = RadioButton2Click
  end
  object CheckBox13: TCheckBox
    Left = 29
    Top = 288
    Width = 166
    Height = 17
    TabStop = False
    Caption = 'Kill Defender SmartScreen.exe'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = CheckBox13Click
  end
  object CheckBox4: TCheckBox
    Left = 29
    Top = 304
    Width = 126
    Height = 17
    TabStop = False
    Caption = 'Execute Kill Task SFC'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object CheckBox6: TCheckBox
    Left = 29
    Top = 320
    Width = 113
    Height = 17
    TabStop = False
    Caption = 'Deactivate Service'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object CheckBox7: TCheckBox
    Left = 29
    Top = 336
    Width = 129
    Height = 17
    TabStop = False
    Caption = 'Deactivate WdNisSvc'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object CheckBox8: TCheckBox
    Left = 29
    Top = 352
    Width = 89
    Height = 17
    TabStop = False
    Caption = 'Keep alive Off'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object CheckBox14: TCheckBox
    Left = 29
    Top = 368
    Width = 137
    Height = 17
    TabStop = False
    Caption = 'Real Time Monitoring Off'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object CheckBox17: TCheckBox
    Left = 29
    Top = 384
    Width = 137
    Height = 17
    TabStop = False
    Caption = 'Real Time Protection Off'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object CheckBox19: TCheckBox
    Left = 29
    Top = 400
    Width = 149
    Height = 17
    TabStop = False
    Caption = 'Security Health Service Off'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object CheckBox21: TCheckBox
    Left = 29
    Top = 416
    Width = 127
    Height = 17
    TabStop = False
    Caption = 'Tamper Protection Off'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object CheckBox24: TCheckBox
    Left = 29
    Top = 432
    Width = 142
    Height = 17
    TabStop = False
    Caption = 'Disable Defender Update'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object CheckBox16: TCheckBox
    Left = 29
    Top = 464
    Width = 161
    Height = 17
    TabStop = False
    Caption = 'Bypass UAC (UAC is enabled)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = CheckBox16Click
  end
  object CheckBox3: TCheckBox
    Left = 29
    Top = 480
    Width = 161
    Height = 17
    TabStop = False
    Caption = 'Bypass Manipulate Protection'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = CheckBox3Click
  end
  object CheckBox23: TCheckBox
    Left = 29
    Top = 496
    Width = 169
    Height = 17
    TabStop = False
    Caption = 'Bypass Trusted Installer Rights'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = CheckBox23Click
  end
  object CheckBox12: TCheckBox
    Left = 269
    Top = 288
    Width = 177
    Height = 17
    TabStop = False
    Caption = 'Run Defender SmartScreen.exe'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = CheckBox12Click
  end
  object CheckBox5: TCheckBox
    Left = 269
    Top = 304
    Width = 81
    Height = 17
    TabStop = False
    Caption = 'Execute SFC'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object Button1: TButton
    Left = 29
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Reboot'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 109
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Refresh'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    TabStop = False
    OnClick = Button2Click
  end
  object CheckBox9: TCheckBox
    Left = 269
    Top = 320
    Width = 98
    Height = 17
    TabStop = False
    Caption = 'Activate Service'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object CheckBox10: TCheckBox
    Left = 269
    Top = 336
    Width = 113
    Height = 17
    TabStop = False
    Caption = 'Activate WdNisSvc'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
  end
  object CheckBox11: TCheckBox
    Left = 269
    Top = 352
    Width = 89
    Height = 17
    TabStop = False
    Caption = 'Keep alive On'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
  end
  object CheckBox15: TCheckBox
    Left = 269
    Top = 368
    Width = 137
    Height = 17
    TabStop = False
    Caption = 'Real Time Monitoring On'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
  end
  object CheckBox18: TCheckBox
    Left = 269
    Top = 384
    Width = 137
    Height = 17
    TabStop = False
    Caption = 'Real Time Protection On'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
  end
  object CheckBox20: TCheckBox
    Left = 269
    Top = 400
    Width = 150
    Height = 17
    TabStop = False
    Caption = 'Security Health Service On'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
  end
  object CheckBox22: TCheckBox
    Left = 269
    Top = 416
    Width = 126
    Height = 17
    TabStop = False
    Caption = 'Tamper Protection On'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
  end
  object CheckBox25: TCheckBox
    Left = 269
    Top = 432
    Width = 140
    Height = 17
    TabStop = False
    Caption = 'Enable Defender Update'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
  end
  object Button3: TButton
    Left = 189
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 29
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 270
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Jump'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 30
    TabStop = False
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 270
    Top = 494
    Width = 172
    Height = 21
    Style = csDropDownList
    DropDownCount = 9
    ItemIndex = 0
    TabOrder = 31
    TabStop = False
    Text = 'AntiSpyware (DWORD)'
    Items.Strings = (
      'AntiSpyware (DWORD)'
      'RealTimeMonotoring (DWORD)'
      'ServiceKeepAlive (DWORD)'
      'WdNisSvc (DWORD : Start)'
      'WinDefend (DWORD : Start)'
      'RealTimeProtection (DWORD)'
      'SecurityHealthService 001 (DWORD : Start)'
      'SecurityHealthService (DWORD : Start)'
      'TamperProtection (DWORD : TamperProtection)')
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 569
    Width = 450
    Height = 19
    Panels = <
      item
        Text = 'Privilegs :'
        Width = 55
      end
      item
        Width = 150
      end
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 568
    ExplicitWidth = 446
  end
end
