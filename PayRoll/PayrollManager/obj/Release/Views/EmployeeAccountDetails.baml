   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  +    %PayrollManager.EmployeeAccountDetails   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  0   *PayrollManager.EmployeeAccountDetailsModel )  %EmployeeAccountDetailsModelDataSource��%   &	          .��� -    �Name$ 
LayoutRoot�� � DataContext ��  �� Source# [   �� Path$ CurrentEmployeeAccount�.+�� $
��Left=�$	��400�����	#33FFFFFF$��0,80,0,0q�$	��Top=�$	��640��.+��� -    ��Name$ AccountNameTxt��$��123,190,0,0q�$
��Left=�$	��Top=�$��33��$	��309��$��16(����� *AccountName+ �� FallbackValue$ Create new Account�� �� UpdateSourceTrigger$ PropertyChanged=��� $��123,100,0,0q�$
��Left=�$	��Top=�$��24��$	��309������ *AccountNumber+$ PropertyChanged=��� $
��Left=�$��26��$��
19,195,0,0q�$
��Wrap=�$��Account Name��$	��Top=�$��99��$��13.333(� �� TextAlignment$ Right=��� -   	 ��Name$	 InstitutionCmb��
 �� DisplayMemberPath$

 Name�� �� SelectedValuePath$ InstitutionId��$��
122,59,0,0q�$
��Left=�$	��Top=�$��29��$	��309�� �� SelectedValue �� *InstitutionId+$ PropertyChanged=����� *Institutions+# [  $ PropertyChanged=��� $
��Left=�$��26��$��	10,99,0,0q�$
��Wrap=�$��Account Number��$	��Top=�$	��108��$��13.333(�$ Right=��� $
��Left=�$��26��$��	18,61,0,0q�$
��Wrap=�$��Institution��$	��Top=�$��99��$��13.333(�$ Right=��� -    ��Name$ SaveBtn��$
��Left=�$��39��$��378,275,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�  TextButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$
��Left=�$��39��$��577,275,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�  CloseButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$
��Left=�$��39��$��338,275,0,0q�$
��Wrap=�$	��Top=�$��34��$ Center=�#���  $��26.667(�$	����$��Segoe UI Symbol)��� $
��Left=�$��26��$��	18,21,0,0q�$
��Wrap=�$��Employee��$	��Top=�$	��100��$��13.333(�$ Right=��� -   $��EmployeeCmb��$
 DisplayName��$ 
EmployeeId��$��
123,21,0,0q�$
��Left=�$	��Top=�$��28��$	��309�� J� RenderTransformOrigin$ 0.501,0.554&� �� *
EmployeeId+$ PropertyChanged=����� *	Employees+# [  �� -   $	 AccountTypeCmb��$
 AccountTypeName��$ AccountType��$��123,143,0,0q�$
��Left=�$	��Top=�$��28��$	��199�� �� 
IsEditable .  �� Text �� *AccountType+$ PropertyChanged=����� *EmployeeAccountTypes+# [  �� $
��Left=�$��26��$��
18,146,0,0q�$
��Wrap=�$��Account Type��$	��Top=�$	��100��$��13.333(�$ Right=��� $
��Left=�$��32.766��$��8.838,14.011,0,0q�$
��Wrap=�$��Create/Edit Accounts��$	��Top=�$��284.54��$��21.333(�