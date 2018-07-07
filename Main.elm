import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MODEL
 
type alias DieRollResult = {
    howMany: Int,
    whatType: Int,
    total: Int
}
type alias DieRoll = {
    howMany : Int,
    whatType: Int
}

type alias Model = {
  seed: Int,
  dieRollResult: DieRollResult
}

model : Model
model = {
  seed = 0,
  dieRollResult = DieRollResult 1 6 2 }

type alias Flags =
  { startTime : Int
  }

init : Flags -> (Model, Cmd Msg )
init flags = ( (Model flags.startTime (DieRollResult 1 6 2)), Cmd.none)

-- UPDATE

type Msg = Seed Int | Roll DieRollResult

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Seed seedValue ->
      ({ model | seed = seedValue }, Cmd.none)
    Roll dieRollResult ->
      ({ model | dieRollResult = dieRollResult }, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick (Roll (DieRollResult 1 6 4) ) ] [ text "roll" ]
    , div [] [ text (toString model) ]
    ]
main: Program Flags Model Msg
main =
  Html.programWithFlags
  { init = init,
    view = view,
    update = update,
    subscriptions = \_ -> Sub.none }
