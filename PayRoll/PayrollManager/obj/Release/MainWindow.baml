   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager      PayrollManager.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     .localclr-namespace:PayrollManager     c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bei9http://schemas.microsoft.com/expression/2010/interactions  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  -     �Name$  Window�� � Title$ 
MainWindow��$��1609.91��$	��480�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ CanResizeWithGrip=� � WindowStyle$
 None=����	#FF3F3F3F � WindowState$ 	Maximized=�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FF4663C4��	 � Offset$	 0.945Q�� $ 	#FFC4C9FF��$	 0.049Q�.��� -   
 �Name$
 
LayoutRoot��.+�   PayrollManager.MainView  $��	0,0,0,105q��� $��80��$��0,0,0,25q�$��Bottom=�$��2q����	#4CFAFAFA J� Effect 3  -System.Windows.Media.Effects.DropShadowEffect     Color$ Green��._�]� -    ]�Name$ 	FooterBar����.  $��80��.+�9� -    9� 
IsExpanded .   9� ExpandDirection$ Right=�$
��Auto��$	��Top=�$��Right=���� $��75��.+��� $��71��   TextButtonStyle#��[  $	��Top=�$��Right=�$��0q�$��72��$��Segoe UI Symbol)�$��40(�$	����.��� $	��300��9� -    .  $ Right=�$
��Auto��$	��Top=�$��Right=���� $��75��.+��� -    ��Name$ PayrollSetupBtn��$��63��$	��Top=�$��Right=�$��0,3,7,0q�$��55��#��[  $��Segoe UI Symbol)�$��40(�$	������ $��Payroll Setup��#��[  $��Right=�$��20��$��0,0,0,-1q�$
��Wrap=�$��Bottom=�$��82�� �� TextAlignment$ Center=�.��� $	��500��.+�� $��0q�.+��� $��Setup Steps��$
��Left=�$��49��$��0,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9�� -   $��2. Create Payroll Item��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	87,32,0,0q�$��Segoe UI Symbol)��� -   $��3. Employee Payroll Setup��#��[  $
��Left=�$��18��$
��Wrap=�$	��Top=�$	��177��$��	87,50,0,0q�$��Segoe UI Symbol)��� -	   $&�� 1. Create Institutional Accounts��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��198��$��87,7,0,0q�$��Segoe UI Symbol)�9� -
    .  $ Right=�$
��Auto��$	��Top=�$��Right=���� $��75��.+��� -   $ PaymentsBtn��$��63��#��[  $	��Top=�$��Right=�$��0,2,0,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Accounts��#��[  $��Right=�$��20��$��0,0,0,-1q�$
��Wrap=�$��Bottom=�$��65��$ Center=�.��� $	��300��.+�� $��0q�.+��� $��Common Tasks��$
��Left=�$��49��$��0,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9�� -   $%�� View Institutional Accounts��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	93,12,0,0q�$��Segoe UI Symbol)��� -   $&��  Create Institutional Account��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	93,29,0,0q�$��Segoe UI Symbol)�9� -    .  $ Right=�$
��Auto��$	��Top=�$��Right=�$��73����� $��75��.+��� -   $ EmployeeBtn��$��63��#��[  $	��Top=�$��Right=�$��0,1,3,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��	Employees��#��[  $��Right=�$��20��$��0,0,0,-1q�$
��Wrap=�$��Bottom=�$��65��$ Center=� J� RenderTransformOrigin$ 
0.535,1.32&�.��� $	��800��.+�� $��	510,7,9,3q�.+��� -   $ editEmp��$��1. Add/Edit Employee��#��[  $
��Left=�$��20��$��93,0,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=��� -   $ EmpAcc��$!��2. Create Employee Accounts��#��[  $
��Left=�$��20��$��	93,21,0,0q�$
��Wrap=�$	��Top=�$	��175��$ Center=��� -   $ emppaysetup��$��3. Employee Payroll Setup��#��[  $
��Left=�$��20��$��	86,41,0,0q�$
��Wrap=�$	��Top=�$	��175��$ Center=��� $��Setup Employees��$
��Left=�$��49��$��0,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9� $��	0,7,295,3q�.+��� $��  Salary Advance��#��[  $
��Left=�$��20��$��	274,0,0,0q�$
��Wrap=�$	��Top=�$	��136��$��Segoe UI Symbol)����	#FFB0B9AD�� $ ��  View Employee History��#��[  $
��Left=�$��20��$��
275,19,0,0q�$
��Wrap=�$	��Top=�$	��175��$��Segoe UI Symbol)����	#FFB0B9AD�� $��Common Tasks��$
��Left=�$��49��$��0,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9�� -   $ �� Review Employe Payroll��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��93,3,0,0q�$��Segoe UI Symbol)��� -   $�� Employee Pay Cheque��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	93,21,0,0q�$��Segoe UI Symbol)�9� -   $��
homeexpand�� . $ Right=�$
��Auto��$	��Top=�$
��Left=���� $��75��.+��� -   $ HomeBtn��$��63��$	��Top=�$
��Left=�$��22,6,0,0q�$��55��#��[  $��Segoe UI Symbol)�$��40(�$	������ $
��Home��#��[  $
��Left=�$��20��$��4,0,0,-1q�$
��Wrap=�$��Bottom=�$��82��$ Center=�.��� $
��1074��.+�� $��	0,7,295,3q�.+��� $��Payroll Steps��$
��Left=�$��49��$��0,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9�� -   $��1. Create Payroll Job��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��93,3,0,0q�$��Segoe UI Symbol)��� -   $��2. Generate Payroll Items��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	93,21,0,0q�$��Segoe UI Symbol)��� -   $��3. Review/Edit Payroll��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	262,3,0,0q�$��Segoe UI Symbol)��� -   $��4. Post Payroll Job��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��
262,21,0,0q�$��Segoe UI Symbol)��� -   $ ��5. Review Employee Cheques��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��	431,3,0,0q�$��Segoe UI Symbol)��� -   $&�� 6. Review Institutional Payments��#��[  $
��Left=�$��30��$
��Wrap=�$	��Top=�$	��164��$��
431,21,0,0q�$��Segoe UI Symbol)��� $��Payroll Config��$
��Left=�$��49��$��	600,5,0,0q�$
��Wrap=�$	��Top=�$��82��$ Center=�$��16(�$
��Bold"����	#FFFDFFB9�� -   $ emppaysetup_Copy��$ ��⚫ Employee Payroll Setup��#��[  $
��Left=�$��20��$��665,21,-61.4,0q�$
��Wrap=�$	��Top=�$	��175��$ Center=��� -   $ editEmp_Copy��$��⚫ Add/Edit Employees��#��[  $
��Left=�$��20��$��682,5,-26.4,0q�$
��Wrap=�$	��Top=�$	��123��$ Center=��� -   $ ��⚫ Add/Edit Payroll Items��#��[  $
��Left=�$��20��$
��Wrap=�$	��Top=�$	��164��$��682,40,-67.4,0q�$��Segoe UI Symbol)�� -    $
 	HeaderBar��$��35��$��0,0,-0.49,0q�$	��Top=����	#00000000.+�� -!   ���	#00000000$��0,0,-0.49,0q��� -"   $	����  CloseButtonStyle#��[ $��Right=�$��50��$	��Top=�$��35��$��Segoe UI Symbol)�$��24(�$��
0,10,0.4,0q��� -#   $	����#���   $��Right=�$��32��$	��Top=�$��30��$��Segoe UI Symbol)�$��24(�$��0,8,39.69,-5q��� -$   $	����#���   $��Right=�$��25��$	��Top=�$��30��$��Segoe UI Symbol)�$��24(�$��0,16,69.69,-6q�