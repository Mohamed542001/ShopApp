part of 'SearchWidgetsImports.dart';

class BuildSearchForm extends StatelessWidget {
  const BuildSearchForm({Key? key, required this.searchData}) : super(key: key);
  final SearchData searchData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: searchData.formKey,
          child: CustomInputFormField(
            controller: searchData.searchController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter text to search';
              }
              return null;
            },
            labeltxt: 'Name',
            prefix: const Icon(Icons.search),
            onFieldSubmitted: (text) {
              SearchCubit.get(context).search(text);
            },
          ),
        );
      },
    );
  }
}
