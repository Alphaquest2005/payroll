   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  /clr-namespace:PayrollManagerPayrollManager      PayrollManager.PayrollJob   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     >
Converters'clr-namespace:PayrollManager.Converters     .localclr-namespace:PayrollManager     c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bei9http://schemas.microsoft.com/expression/2010/interactions  $	��252��  � 	Resources  $   PayrollManager.PayrollJobModel   PayrollJobModelDataSource6   0PayrollManager.Converters.DisablePostedConverter  PostedConverter��%   &	        &	          .��� -    �Name$ 
LayoutRoot�� � DataContext ��  �� Source# [   �� Path$ CurrentPayrollJob�.+�(  "System.Windows.Controls.DatePicker  $��
115,59,0,0q�$
��Left=�$	��Top=�$��27��$	��161��   SelectedDate �� *	StartDate+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�{��� # [  $ CurrentPayrollJob.Status� �� 	Converter# [   $��
115,91,0,0q�$
��Left=�$	��Top=�$	��161�� �� *	EndDate+$ TwoWay=�$ PropertyChanged=�{��� # [  $ CurrentPayrollJob.Status�# [ �� $
��Left=�$��23��$��	20,63,0,0q�$
��Wrap=�$��
Start Date��$	��Top=�$��84��	 �� TextAlignment$	 Right=��� $
��Left=�$��22��$��	20,91,0,0q�$
��Wrap=�$��End Date��$	��Top=�$��84��$	 Right=��� $
��Left=�$
��34.8��$��31.5,10,0,0q�$
��Wrap=�$��Start Payroll Job��$	��Top=�$��241.2��$��26(��� 
 �� DisplayMemberPath$

 Name�� �� SelectedValuePath$ PayrollJobTypeId��$
��Left=�$��25��$��115,170,0,0q�$	��Top=�$	��161�� �� SelectedValue �� *PayrollJobTypeId+$ PropertyChanged=����� *PayrollJobTypes+# [  {��� # [  $ CurrentPayrollJob.Status�# [ �� $
��Left=�$��22��$��
20,170,0,0q�$
��Wrap=�$��Job Type��$	��Top=�$��84��$	 Right=�  $��115,131,0,0q�$
��Left=�$	��Top=�$	��161�� �� *PaymentDate+$ TwoWay=�$ PropertyChanged=�{��� # [  $ CurrentPayrollJob.Status�# [ �� $
��Left=�$��22��$��
20,131,0,0q�$
��Wrap=�$	��Top=�$��84��$	 Right=��� $�Payment Date���� �� �� -    ��Name$ SaveBtn��$
��Left=�$��27��$��240,215,0,0q�$
��Wrap=�$	��Top=�$��33��$	 Center=�  TextButtonStyle#���  $��20(�{��� # [  $ CurrentPayrollJob.Status�# [ �� $��Segoe UI Symbol)� � Language$ en-us�.��� $	����� -   $ 	DeleteBtn��$
��Left=�$��27��$��338,215,0,0q�$
��Wrap=�$	��Top=�$��33��$	 Center=�  CloseButtonStyle#���  $��20(��� $��Segoe UI Symbol)�$ en-us�.��� $	����� �� $��Segoe UI Symbol)�$ en-us�.��� �� -   $ NewBtn��$
��Left=�$��27��$��202,215,0,0q�$
��Wrap=�$	��Top=�$��32��$	 Center=�#���  $��20(�$	����$��Segoe UI Symbol)�