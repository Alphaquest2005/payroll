   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  #    PayrollManager.AccountDetails   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  (   "PayrollManager.AccountDetailsModel !  AccountDetailsModelDataSource��%   &	          .��� -    �Name$ 
LayoutRoot�� � DataContext ��  �� Source# [   �� Path$ CurrentInstitutionAccount�.+�� $
��Left=�$	��400�����	#33FFFFFF$��0,80,0,0q�$	��Top=�$	��640��.+��� $��
123,23,0,0q�$
��Left=�$	��Top=�$��33��$	��309��$��16(����� *AccountName+ �� FallbackValue$ Create new Account�� �� UpdateSourceTrigger$ PropertyChanged=��� $��
123,66,0,0q�$
��Left=�$	��Top=�$��24��$	��309������ *AccountNumber+$ PropertyChanged=��� $
��Left=�$��26.307��$��18.323,23.28,0,0q�$
��Wrap=�$��Account Name��$	��Top=�$��99.331��$��13.333(� �� TextAlignment$ Right=���  �� DisplayMemberPath$
 Name��	 �� SelectedValuePath$	 InstitutionId��$��122.654,100.552,0,0q�$
��Left=�$	��Top=�$��28.894��$��309.044��
 �� SelectedValue
 �� *InstitutionId+$ PropertyChanged=����� *Institutions+# [  �� $
��Left=�$��26��$��	10,65,0,0q�$
��Wrap=�$��Account Number��$	��Top=�$	��108��$��13.333(�$ Right=��� $
��Left=�$��26.307��$��18.323,100.552,0,0q�$
��Wrap=�$��Institution��$	��Top=�$��99.331��$��13.333(�$ Right=��� -    ��Name$ SaveBtn��$
��Left=�$��39��$��378,265,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�  TextButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$
��Left=�$��39��$��577,265,0,0q�$
��Wrap=�$	��Top=�$��35��$ Center=�  CloseButtonStyle#���  $��26.667(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$
��Left=�$��39��$��338,265,0,0q�$
��Wrap=�$	��Top=�$��34��$ Center=�#���  $��26.667(�$	����$��Segoe UI Symbol)��� $ AccountTypeName��$	 AccountTypeName��$��123,143,0,0q�$
��Left=�$	��Top=�$��28��$	��199�� �� 
IsEditable .  �� Text �� *AccountType+$ PropertyChanged=����� *AccountTypes+# [  �� $
��Left=�$��26��$��
18,143,0,0q�$
��Wrap=�$��Account Type��$	��Top=�$	��100��$��13.333(�$ Right=��� -   $��InstitutionAccountCmb��$
 Name��$	 InstitutionId��$��123,209,0,0q�$
��Left=�$	��Top=�$��29��$	��309��
 �� *PayeeInstitutionId+$ PropertyChanged=����� *Institutions+# [  �� $
��Left=�$��26��$��
18,212,0,0q�$
��Wrap=�$��Payee��$	��Top=�$	��100��$��13.333(�$ Right=��� $
��Left=�$��32.766��$��8.838,14.011,0,0q�$
��Wrap=�$��Create/Edit Accounts��$	��Top=�$��284.54��$��21.333(�