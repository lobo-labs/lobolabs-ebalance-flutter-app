import 'package:flutter_svg/flutter_svg.dart';

class Destination {
   Destination(this.icon, this.label);

  final SvgPicture icon;
  final String label;
}

SvgPicture accountIcon = SvgPicture.asset('account.svg');
SvgPicture companyIcon = SvgPicture.asset('company.svg');
SvgPicture customerIcon = SvgPicture.asset('customer.svg');
SvgPicture expensesIcon = SvgPicture.asset('expense.svg');
SvgPicture financialIcon = SvgPicture.asset('financial.svg');
SvgPicture salesIcon = SvgPicture.asset('sale.svg');
SvgPicture providerIcon = SvgPicture.asset('provider.svg');
SvgPicture receiverIcon = SvgPicture.asset('receiver.svg');
SvgPicture signOutIcon = SvgPicture.asset('signout.svg');
SvgPicture menuIcon = SvgPicture.asset('menu.svg');

List<Destination> getRailDestinations(bool isAdmin) {
  if (isAdmin) {
    return [
      Destination(companyIcon, 'Empresas (Admin)'),
      Destination(financialIcon, 'Financeiro'),
      Destination(salesIcon, 'Vendas'),
      Destination(expensesIcon, 'Despesas'),
      Destination(customerIcon, 'Clientes'),
      Destination(providerIcon, 'Fornecedores'),
      Destination(receiverIcon, 'Destinatários'),
      Destination(SvgPicture.asset('company.svg'), 'Usuários'),
      Destination(companyIcon, 'Empresas')
    ];
  } else {
    return [
      Destination(financialIcon, 'Financeiro'),
      Destination(salesIcon, 'Vendas'),
      Destination(expensesIcon, 'Despesas'),
      Destination(customerIcon, 'Clientes'),
      Destination(providerIcon, 'Fornecedores'),
      Destination(receiverIcon, 'Destinatários'),
      Destination(SvgPicture.asset('company.svg'), 'Usuários'),
      Destination(companyIcon, 'Empresas'),
    ];
  }
}

getBottomNavigationDestinations() => [
       Destination(financialIcon, 'Financeiro'),
       Destination(salesIcon, 'Vendas'),
       Destination(expensesIcon, 'Despesas'),
       Destination(menuIcon, 'Menu'),
    ];

getMenuDestinations(bool isAdmin) {
  if (isAdmin) {
    return [
       Destination(customerIcon, 'Clientes'),
       Destination(providerIcon, 'Fornecedores'),
       Destination(receiverIcon, 'Destinatários'),
       Destination(SvgPicture.asset('company.svg'), 'Usuários'),
       Destination(SvgPicture.asset('company.svg'), 'Empresas'),
       Destination(signOutIcon, 'Sair'),
    ];
  } else {
    [
       Destination(companyIcon, 'Empresas (Admin)'),
       Destination(customerIcon, 'Clientes'),
       Destination(providerIcon, 'Fornecedores'),
       Destination(receiverIcon, 'Destinatários'),
       Destination(SvgPicture.asset('company.svg'), 'Usuários'),
       Destination(companyIcon, 'Empresas'),
       Destination(signOutIcon, 'Sair')
    ];
  }
}
