import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:states/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super( UserInitialState() ) {
    on<ActivateUserEvent>( (event, emit) {
      emit( UserSetState( event.user ));
    });

    on<ChangeUserAgeEvent>( (event, emit) {
      if ( !state.existUser ) return;
      emit( UserSetState( state.user!.copyWith( age: event.age ) ));
    });

    on<AddProfessionEvent>( (event, emit) {
      if ( !state.existUser ) return;

       final newUser = state.user!.copyWith( 
        professions: [
          ...state.user!.professions,
          'Profesión ${ state.user!.professions.length + 1 }'
        ] );

      emit( UserSetState( newUser ));
    });        

    on<DeleteUserDataEvent>( (event, emit) {
      if ( !state.existUser ) return;
      emit( UserInitialState() );
    });

  }
}