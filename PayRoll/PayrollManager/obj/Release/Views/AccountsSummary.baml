   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel $    PayrollManager.AccountsSummary   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
converters'clr-namespace:PayrollManager.Converters     Hscm8clr-namespace:System.ComponentModel;assembly=WindowsBase       � 	Resources  )   #PayrollManager.AccountsSummaryModel "  AccountsSummaryModelDataSource  cvs �� Source �� Source �� SortDescriptions+  %System.ComponentModel.SortDescription   PropertyName   	Direction �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName  ItmTemplate J� 	AllowDrop	 J� RenderTransformOrigin
 �� TextAlignment �� StringFormat   booleanToVisibilityConverter��%<  &	        &	      7   &	 �     &	       ��  �� *
Accounts+8      $ AccountType��$ 
Descending=�  $ AccountName��  $ Total��   $ AccountType���� .R�� $��55�� . $	��619��
�������.+��� $��Right=�$	 0.5,0.5&�$	��130��$��
0,0,172,20q�$��24(�$
 Right=����� *
TotalDebit+$ c���� $
��Auto��$
��Auto��$��10,3,331,21q�$��18.667(����� *AccountName+�� $��37.6,34.82,0,0q�$
��Left=�$	��Top=�$��181.773������ *Institution.Name+�� $��292.7,37.82,0,0q�$
��Left=�$	��Top=�$��185.82������ *AccountNumber+�� $
��Left=�$��16.54��$��239.9,33.9,0,0q�$
��Wrap=�$��Acct#:��$	��Top=�$
��47.8���� $��Right=�$	 0.5,0.5&�$	��142��$��	0,0,10,20q�$��24(�$
 Right=����� *TotalCredit+$ c���� .��� -    �Name$ 
LayoutRoot��$��	0,0,0.4,0q� � DataContext �� # [  .+��� $3��-Please Post Payroll to see accounting figures��$��10,106,411,333q�$��18(��� $	��3.5q�$��	0,104,0,0q����	#4DFFFFFF#��[  �� AlternationCount$ 2�� �� SelectedItem �� *CurrentInstitutionAccount+ �� Mode$ OneWayToSource=����� *InstitutionAccounts+ �� IsAsync .  �� �� $
��Left=�$��35��$��	28,10,0,0q�$
��Wrap=�$$��Institutional Accounts Summary��$	��Top=�$	��368��$��24(��� $��
323,71,0,0q�$
��Left=�$	��Top=�$��30��$	��137��$��18.667(����	#FFFDFDCF$
 Right=����� *InstitutionAccountsTotalDebit+$ c���� $
��Left=�$��25��$��
371,49,0,0q�$
��Wrap=�$��Total Debit��$	��Top=�$��87��$
 Right=�$��14(����	#FFFDFDCF�� $��
479,71,0,0q�$
��Left=�$	��Top=�$��30��$	��141��$��18.667(����	#FFFDFDCF$
 Right=����� * InstitutionAccountsTotalCredit+$ c���� $
��Left=�$��25��$��
537,49,0,0q�$
��Wrap=�$��Total Credit��$	��Top=�$��83��$
 Right=�$��14(����	#FFFDFDCF�� $��
639,71,0,0q�$
��Left=�$	��Top=�$��30��$	��109��$��18.667(����	#FFFDFDCF$
 Right=����� *InstitutionAccountsTotal+$ c���� $
��Left=�$��17��$��
698,52,0,0q�$
��Wrap=�$��Total��$	��Top=�$��50��$
 Right=�$��14(����	#FFFDFDCF