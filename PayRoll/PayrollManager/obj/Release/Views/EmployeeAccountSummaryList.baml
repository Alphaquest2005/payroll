   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  /    )PayrollManager.EmployeeAccountSummaryList   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  )   #PayrollManager.AccountsSummaryModel "  AccountsSummaryModelDataSource   booleanToVisibilityConverter  ItmTemplate J� 	AllowDrop J� RenderTransformOrigin �� TextAlignment �� StringFormat(   "PayrollManager.AccountDetailsModel ! AccountDetailsModelDataSource��%�  &	        &	      &	 
     &	 y      �� �� .R�� $��54.62�� . .+��� $��Right=�$ 0.5,0.5&�$	��106��$��0,0,-0.48,16.62q�$��24(�$ Right=����� *Total+$ c���� $
��Auto��$
��Auto��$��10,3,207.52,21.62q�$��18.667(�$
��Wrap=����� *AccountName+�� $��37.6,34.82,0,0q�$
��Left=�$	��Top=�$��181.773������ *Employee.DisplayName+�� $��292.7,37.82,0,0q�$
��Left=�$	��Top=�$��185.82������ *AccountNumber+�� $
��Left=�$��16.54��$��239.9,33.9,0,0q�$
��Wrap=�$��Acct#:��$	��Top=�$
��47.8���� $��Right=�$��17��$��0,10,110.4,0q�$
��Wrap=�$	��Top=�$��83������ *AccountType+  .��� -    �Name$ 
LayoutRoot��$��	0,0,0.4,0q� � DataContext ��  �� Source# [  .+��� $	��3.5q�$��0,112,-0.4,0q����	#4DFFFFFF#��[  �� AlternationCount$ 2��	 �� SelectedItem	 �� *CurrentEmployeeAccount+
 �� Mode$
 OneWayToSource=����� *" CurrentEmployee.EmployeeAccounts+ ��    �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *SystemColors.ControlBrushKey+)(�� *     *$"SystemColors.HighlightTextBrushKey+)�� $ 	BurlyWood���� $ 	Chocolate���� # Z�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle ��  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� 
TargetType" ��.R��  � RowDefinitions �� �� .+�� $ gridTemplate��
���   �$��26��$��Center=�  ��%_   '��       �� " ��.���  � ��$ 14(���  � ��
 �������  � ��$ Center=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $��45 ��� $��30 ��� $	��110 �.+�d�  d�Name$ btnShowHide�� d� 	IsChecked$
 TrueY�$	��3.5q��� $��1��$��3.5,0q����� *AccountType+�� $��2��$��Count:���� $��3��$ Right=�$��0,0,11,0q����� *	ItemCount+�� $��4��$ Right=�$��0,0,15,0q����� *Total+$ {0:C}���� $��1��$��
11,0,0,3.5q�y��� *	IsChecked+ �� 	Converter# [  �� ElementName$ btnShowHide�� �� Triggers ��  �� Value$
 True�� �� Binding �� *IsBottomLevel+.a���  �� 
TargetName$ gridTemplate�� � �� �	#FF965F00�� $
��Left=�$��35��$��	28,10,0,0q�$
��Wrap=�$��Employee Accounts Summary��$	��Top=�$	��407��$��24(��� -    ��Name$ EmployeeCmb�� �� DisplayMemberPath$ DisplayName�� �� SelectedValuePath$ 
EmployeeId��$��	53,56,0,0q�$
��Left=�$	��Top=�$��35��$	��399��$ 0.501,0.554&�$��16(�	 �� *CurrentEmployee+$
 OneWayToSource=����� *	Employees+# [ 