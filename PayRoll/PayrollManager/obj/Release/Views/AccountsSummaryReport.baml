   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel *    $PayrollManager.AccountsSummaryReport   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
Converters'clr-namespace:PayrollManager.Converters     SComponentModel8clr-namespace:System.ComponentModel;assembly=WindowsBase       � 	Resources  /   )PayrollManager.AccountsSummaryReportModel (  $AccountsSummaryReportModelDataSource<   6PayrollManager.Converters.PayrollItemSubtotalConverter   PayrollItemSubtotalConverter   booleanToVisibilityConverter  cvs �� Source �� Source �� SortDescriptions+  %System.ComponentModel.SortDescription   PropertyName   	Direction �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName  AccountTemplate J� 	AllowDrop	 J� RenderTransformOrigin
 �� TextAlignment �� StringFormat  AccountEntryTemplate  ReportListBox �� IsAsync��%�  &	        &	      &	 
     &	      7   &	 �     &	 �        �� ��  �� *AccountsSummaryData+8      $ Priority��$ 	Ascending=�  $ PayrollItem.Name��  $ Amount��   $ IncomeDeduction���� .R�� $��Auto    �� . $	��619��.+��� $��Right=�$	��Top=�$	 0.5,0.5&�$	��130��$��
0,0,172,62q�$��24(�$
 Right=����� *
TotalDebit+$ c���� $
��Left=�$	��Top=�$
��Auto��$	��302��$��10,3,0,0q�$��18.667(����� *AccountName+�� $��	38,38,0,0q�$
��Left=�$��Bottom=�$	��181������ *Institution.Name+�� $��
293,38,0,0q�$
��Left=�$��Bottom=�$	��186������ *AccountNumber+�� $
��Left=�$��16��$��
240,38,0,0q�$
��Wrap=�$��Acct#:��$��Bottom=�$��48���� $��Right=�$	��Top=�$	 0.5,0.5&�$	��142��$��0,2,10,0q�$��24(�$
 Right=����� *TotalCredit+$ c���� $
��Left=�$
��Auto��$��38,40,-13,25q�$	��Top=�$	��594��#���  #���  ���� *PayrollSummary+ . �� .R�� .+��� $��20,-10,-288,-11.8q�$��16(����� *PayrollItemName+�� $��245,-10,-403,-12q�$��18.667(�$
 Right=����� *DebitAmount+$ c���� $��408,-10,-560,-12.8q�$��18.667(�$
 Right=����� *CreditAmount+$ c��.��� -    �Name$ 
LayoutRoot�� � DataContext �� # [  .+��� -     TextButtonStyle#���  $
��Left=�$��30��$��810,6,-265,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)��� -    ��Name$ 	ReportBRD��$��24,41,24.4,0.4q�$	��867��._��� -    ��Name$ 	ReportGrd��$��0,0,0,10q�.��� -   $ DailyReportGD��$��Center=�$
��Auto��$	��Top=�$	��816��
������� �� .+�� $
��Left=�$��38��$��	40,97,0,0q�$	��Top=�$	��734�����	#FFD7D7D7.+��� $��	322,2,0,0q�$
 Right=�$
��Left=�$	��Top=�$	��412��$��36��$��21.333(����	#FF353623���� *PayrollJobTotal+$ Gross Payroll Job {0:c}���� $��Center=�$
��31.8��$��460,65.2,42,0q�$
��Wrap=�$��Accounts Summary��$	��Top=�$	��314��$��25(�$
 Right=�
���   �
��������� $��
546,13,0,0q�$
��Left=�$	��Top=�$��14.667(�
���   �$	��228��$
 Right=����� *Date+�� $
��Left=�$��24��$
��Wrap=�$	��Top=�$��76��$��421,155,0,0q�$��20(����	#FF393939$
 Right=�$��Debit���� $��40,140,42,30q� �� Orientation$ Vertical=�$
��Auto��.+��� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��237��$��
17,15,0,15q�$��20(����	#FF393939$

 Left=�$��Payroll Item Summary���� $	��3.5q�$��0,0,0,0q����	#4DFFFFFF#���  #���  ���� *InstitutionAccounts+ .    �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *SystemColors.ControlBrushKey+)(�� *     *$"SystemColors.HighlightTextBrushKey+)�� $ 	BurlyWood���� $ 	#FFD5D5D5���� # Z�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle ��  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� 
TargetType" ��.R��  � RowDefinitions �� �� .+�� $ gridTemplate��
���   �$��26��$��Center=�  ��%_   '��       �� " ��.���  � ��$ 14(���  � ��
 �������  � ��$ Center=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $��45 ��� $��30 ��� $	��110 �.+�d�  d�Name$ btnShowHide�� d� 	IsChecked$
 TrueY�$	��3.5q�$y�Hidden=��� $��1��$��3.5,0q�$��16(����� *Name+�� $��2��$��Count:���� $��3��$
 Right=�$��0,0,11,0q����� *	ItemCount+�� $��4��$
 Right=�$��0,0,15,0q�$��16(�$
��Bold"�����  �� 	Converter# [ $ {0:C}���� $��1��$��
11,0,0,3.5q�y��� *	IsChecked+# [  �� ElementName$ btnShowHide�� �� Triggers ��   �� Value$
  True��! �� Binding! �� *IsBottomLevel+.a��� " �� 
TargetName$" gridTemplate�� � �� �	#FFEBEAE9�� $
��Left=�$
��29.6��$��37.3,13.4,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��24(����� *Institution1.Name+�� $
��Left=�$��20��$��37.3,48,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountName+�� $
��Left=�$��24��$��	40,73,0,0q�$
��Wrap=�$	��Top=�$	��321��$��16(�$
��Bold"����� *CurrentPayrollJob.Name+�� $
��Left=�$��24��$
��Wrap=�$	��Top=�$��76��$��579,155,0,0q�$��20(����	#FF393939$
 Right=�$��Credit���� -   #���  $
��Left=�$��30��$��	810,6,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)�