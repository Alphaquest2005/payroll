   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  &     PayrollManager.Views.IntroScreen   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager       � 	Resources  %   PayrollManager.IntroScreenModel   IntroScreenModelDataSource  PayrollJobTemplate3 �� EndPoint �� 
StartPoint � Color � Offset ��Name �� StringFormat �� TextAlignment �� UpdateSourceTrigger��%  &	        &	        �� .R�� $��62��$	��471������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#4CE3D7A3��$ 0.958Q�� $ 0.126Q�.+��� $ NameTxt��$��61,5,123,32q�$��16(�$
��Bold"����� *Name+�� $ 	StatusTxt��$��0,15.96,0,0q�$
��Left=�$	��Top=�$��23.16��$��54.527��$��18.667(����� *Status+�� $ DurationTxt��$��61,32,245.527,-0.48q�$��18.667(����� *DurationInDays+$ 0 Days���� $ NetAmountTxt��$��
353,10,0,0q�$
��Left=�$	��Top=�$��42��$	��108��$��18.667(�$ Right=����� *	NetAmount+$ c��$ PropertyChanged=��� $ DurationTxt_Copy��$��189,35,117.527,-0.48q�$��15(����� *PaymentDate+$ 	MMM-dd-yy���� $
��Left=�$��23��$��162,39,0,-0.48q�$
��Wrap=�$	��Due��$	��Top=�$��22��.��� -   	 �Name$	 
LayoutRoot��$��0,0,0.333,0q�
 � DataContext
 ��  �� Source# [  .+��� $
��Left=�$	��349��#���  $��214,80,-65.333,0q�$	��Top=�$	��534�����	#4CF8F8F8���� *PayrollJobs+ �� SelectedItem �� *CurrentPayrollJob+ �� Mode$ TwoWay=��� $
��Left=�$
��45.6��$��213.8,10,0,0q�$
��Wrap=�$��Select Payroll Job��$	��Top=�$��245.327��$��26(��� -   $ StartJobBtn��$
��Left=�$
��24.8��$��10,81.4,0,0q�$
��Wrap=�$	��Top=�$��116.8��$��16(�  TextButtonStyle#���  �� $�Start New Job���� �� �� -   $ ConfigPayItemsBtn��$
��Left=�$
��24.8��$��10,111.2,0,0q�$
��Wrap=�$	��Top=�$	��171��$��16(�$��Configure Payroll  Items��#���  �� $
��Left=�$
��24.8��$��
10,141,0,0q�$
��Wrap=�$	��Top=�$	��171��$��16(�#���  �� -    ��Name$ 
PayrollBtn��$�Create New Payroll Item���� �� �� $
��Left=�$��64��$��
10,218,0,0q�$
��Wrap=�$	��Top=�$	��171��$��20(�#���  �� -   $ GenPayrollBtn��$$�Generate Payroll Items for Job���� �� �� $
��Left=�$��64��$��
10,287,0,0q�$
��Wrap=�$	��Top=�$	��171��$��20(�#���  �� -   $ PostPayrollBtn1��$�Post Payroll Job���� �� �� $
��Left=�$��30��$��
648,10,0,0q�$	��Top=�$	��100�� �� SelectedValue �� *CurrentYear+���� *	YearLst+