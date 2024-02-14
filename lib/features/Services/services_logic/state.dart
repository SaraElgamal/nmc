import 'package:n_m_c/features/categories/categories_model/categories_model.dart';

abstract class ServicesStates{}
class InitialServicesState extends ServicesStates{}
class GetLoadingServicesState extends ServicesStates
{
}
class GetSuccessServicesState extends ServicesStates
{
}
class GetSuccessFooterState extends ServicesStates
{
}
class GetSuccessDefinitionState extends ServicesStates
{
}
/// ////
class GetLoadingEngagementsState extends ServicesStates
{
}
class GetSuccessEngagementsState extends ServicesStates
{
}
class GetSuccessCardFeaturesContentState extends ServicesStates
{
}
class GetSuccessCardFeaturesImagesState extends ServicesStates
{
}
class GetSuccessOurCustomersState extends ServicesStates
{
}
/// /////

class GetCallUsState extends ServicesStates
{

}
class GetErrorCallUsState extends ServicesStates
{

}
