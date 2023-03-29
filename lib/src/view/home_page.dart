import 'package:interview_application/src/theme/theme.dart' as custom_theme;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_application/l10n/l10n_extension.dart';
import 'package:interview_application/src/services/data_service.dart';
import 'package:interview_application/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'bloc/bloc.dart';
import 'detailed_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DataService dataService = DataService();
    final l10n = context.l10n;
    final theme = custom_theme.Theme.of(context);
    return BlocProvider(
      create: (context) => DataBloc(
        dataService,
      )..add(DataEvent.fetchingStarted()),
      child: Consumer<custom_theme.ModelTheme>(
        builder: (context, custom_theme.ModelTheme themeNotifier, child) {
          return Scaffold(
            backgroundColor: theme.colorScheme.backgroundColor,
            appBar: AppBar(
              backgroundColor: theme.colorScheme.primaryColor,
              title: Text(l10n.homePageAppbarTitle),
              actions: [
                IconButton(
                    icon: Icon(themeNotifier.isDark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny),
                    onPressed: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    })
              ],
            ),
            body: _HomePageBody(),
          );
        },
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<DataBloc>();
    return Stack(
      children: [
        const _HomePageListBody(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  text: l10n.refreshButtonText,
                  onPressed: () {
                    bloc.add(DataEvent.fetchingStarted());
                  })
            ],
          ),
        ),
      ],
    );
  }
}

class _HomePageListBody extends StatelessWidget {
  const _HomePageListBody();

  @override
  Widget build(BuildContext context) {
    final status = context.select((DataBloc bloc) => bloc.state.status);
    final l10n = context.l10n;
    final theme = custom_theme.Theme.of(context);
    switch (status) {
      case DataStatus.initial:
      case DataStatus.isLoading:
        return Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.primaryColor,
          ),
        );
      case DataStatus.success:
        return _HomePageListView();
      case DataStatus.loadingFailed:
        return Center(
          child: Text(l10n.failedToLoadContentMessage),
        );
    }
  }
}

class _HomePageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DataBloc>().state;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final cardData = state.data![index];

                    return DataCard(
                      onTap: () {
                        if (!kIsWeb && Platform.isAndroid || Platform.isIOS) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetailedPage(dataModel: cardData);
                          }));
                        }
                      },
                      title: 'id:${cardData.orderId}  ${cardData.title} ',
                      description: cardData.description,
                      imageUrl: cardData.image_url,
                      lastModificated: cardData.modificationDate,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
