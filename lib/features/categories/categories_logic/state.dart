import 'package:n_m_c/features/categories/categories_model/categories_model.dart';

abstract class CategoriesStates{}
class InitialCategoriesState extends CategoriesStates{}
class GetLoadingCategoriesState extends CategoriesStates
{
}
class GetSuccessCategoriesState extends CategoriesStates
{

}
class GetSuccessgetFilterDataState extends CategoriesStates
{

}
class GetErrorCategoriesState extends CategoriesStates
{

}

