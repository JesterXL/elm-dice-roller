import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Random

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
  dieFace: Int,
  dieRollResult: DieRollResult
}

model : Model
model = {
  seed = 0,
  dieFace = 1,
  dieRollResult = DieRollResult 1 6 2 }

type alias Flags =
  { startTime : Int
  }

init : Flags -> (Model, Cmd Msg )
init flags = (Model flags.startTime 1 (DieRollResult 1 6 3), Cmd.none)

-- UPDATE
type Msg = Seed Int | Roll | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Seed seedValue ->
      ({ model | seed = seedValue }, Cmd.none)
    NewFace newFace ->
      ({model | dieFace = newFace}, Cmd.none)
    Roll ->
      ( model, Random.generate NewFace (Random.int 1 6))
      

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Roll ] [ text "roll" ]
    , div [] [ text (toString model) ]
    ]
main: Program Flags Model Msg
main =
  Html.programWithFlags
  { init = init,
    view = view,
    update = update,
    subscriptions = \_ -> Sub.none }
