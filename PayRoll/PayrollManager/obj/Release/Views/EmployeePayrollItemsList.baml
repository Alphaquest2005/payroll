   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel -    'PayrollManager.EmployeePayrollItemsList   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
converters'clr-namespace:PayrollManager.Converters     Hscm8clr-namespace:System.ComponentModel;assembly=WindowsBase       � 	Resources  2   ,PayrollManager.EmployeePayrollItemsListModel +  'EmployeePayrollItemsListModelDataSource   EmployeePayrollItemSummaryDT �� StringFormat  cvs �� Source �� Source �� SortDescriptions+  %System.ComponentModel.SortDescription   PropertyName   	Direction �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName<   6PayrollManager.Converters.PayrollItemSubtotalConverter   PayrollItemSubtotalConverter8   2PayrollManager.Converters.BooleanToIncomeDeduction  BooleanToIncomeDeduction	 �� 
TargetType
 �� Property �� Value   booleanToVisibilityConverter �� 
TargetType ��Name �� Triggers P� Property P� Value �� 
TargetName  EmployeeAccountTemplate��%x  &	        &	      &	 �    7   &	 V    &	 [    '�� `    &	 �    'd� �    &	 �      �� .R�� $
��50.4��$	��440��.+��� $��34,0,0,0q�$
��Left=�$	��Top=�$��27.96��$��227.09��$��18.667(����� *Name+�� $��327.85,2,0,0q�$
��Left=�$	��Top=�$
��40.4��$��102.15��$��26.667(����� *Amount+$ c���� $
��Left=�$��14.44��$��34,27.96,0,0q�$
��Wrap=�$��Paid to:��$	��Top=�$��44���� $��95.6,27.96,0,0q�$
��Left=�$	��Top=�$��204.483������ * CreditAccount.Institution.Name+��  �� *PayrollItemList+8      $ IncomeDeduction��$ 
Descending=�  $
 Name��  $ Amount��   $ IncomeDeduction��    �� "	 ��.��� 
 � ��$ Stretch=��� 
 � ��
 ������� 
 � ��$ 14(��� �� "	 d�.��� 
 � ��$ Center=��� 
 � ��$ Center=��� 
 � ��$ 1q��� 
 � ��$ 12���� 
 � ��$ 12���� 
 � �� �� " d�.R��� $	 img��$��..\Styles\Collapse.png�� P�  �@d�	IsChecked$ FalseY�. ��� $	 img��
 � ��$ ..\Styles\Expand.png���� .R��� .+��� ���� *Employee.DisplayName+.��� -    �Name$ 
LayoutRoot�� � DataContext �� # [  .+��� $	��3.5q�$��
14,77,0,10q����	#4DFFFFFF���� # [  �� SelectedItem �� *CurrentPayrollItem+ �� Mode$ OneWayToSource=�   �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *SystemColors.ControlBrushKey+)(�� *     *$"SystemColors.HighlightTextBrushKey+)�� $ 	BurlyWood���� $ 	Chocolate���� # Z�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle �� "	 ��.��� 
 � �� �� " �� ��  �� Value$
 True�� �� Binding ��  �� Path$ IsBottomLevel�.a��� $ gridTemplate��
 � �� �	#FF965F00.R��  � RowDefinitions �� �� .+�� $ gridTemplate��
���   �$��26��$��Center=�  ��%_   '��       �� "	 ��.��� 
 � ��$ 14(��� 
 � ��
 ������� 
 � ��$ Center=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $��45 ��� $��30 ��� $	��110 �.+�d�  d�Name$ btnShowHide�� d� 	IsChecked$
 TrueY�$	��3.5q��� $��1��$��3.5,0q����� *Name+  �� 	Converter#  [ �� $��2��$��Count:���� $��3��! �� TextAlignment$! Right=�$��0,0,11,0q����� $ 	ItemCount��� $��4��$! Right=�$��0,0,15,0q����� $ {0:C}��#  [ �� $��1��$��
11,0,0,3.5q�y��� " �� ElementName$" btnShowHide��$ 	IsChecked�#  [ ���� .R�� $��54.62��.+��� $��Right=�# J� RenderTransformOrigin$# 0.5,0.5&�$��102.4��$��
0,0,0,0.22q�$��24(�$! Right=����� *Amount+$ C���� $
��Auto��$
��Auto��$��10,0,198,24.8q�$��18.667(����� *Name+�� $��28.7,34.82,0,0q�$
��Left=�$	��Top=�$��190.673������ * CreditAccount.Institution.Name+�� $��292.7,34.82,0,0q�$
��Left=�$	��Top=�$��185.82������ *CreditAccount.AccountNumber+�� $
��Left=�$��16.54��$��239.9,33.9,0,0q�$
��Wrap=�$��Acct#:��$	��Top=�$
��47.8���� $
��Left=�$
��39.2��$��	22,10,0,0q�$
��Wrap=�$	��Top=�$��525.6��$��26(����� *CurrentEmployee.DisplayName+$ Payroll Items for {0}��$ OneWay=�# [  