import 'package:blueprint/src/generated/l10n.dart';
import 'package:blueprint/src/presentation/common_blocs/authority/authority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Dropdown widget for selecting user authorities/roles.
/// Displays available authority options from AuthorityBloc.
/// Updates when authorities state changes.
class AuthoritiesDropdown extends StatelessWidget {
  final bool enabled;
  final String? initialValue;

  const AuthoritiesDropdown(
      {super.key, this.enabled = true, this.initialValue});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthorityBloc>(context).add(const AuthorityLoad());
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: BlocBuilder<AuthorityBloc, AuthorityState>(
        builder: (context, state) {
          if (state is AuthorityLoadSuccessState) {
            final authorities = ["", ...state.authorities];
            return FormBuilderDropdown(
              enabled: enabled,
              name: 'authorities',
              decoration: InputDecoration(hintText: S.of(context).authorities),
              items: authorities
                  .map((e) => DropdownMenuItem(value: e, child: Text(e ?? "")))
                  .toList(),
              initialValue: initialValue ?? authorities.first,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
