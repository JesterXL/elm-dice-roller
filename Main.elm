import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

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

type alias Model = DieRollResult

model : Model
model = DieRollResult 1 6 2

-- UPDATE

type Msg = Roll

update : Msg -> Model -> Model
update msg model =
  case msg of
    Roll ->
      DieRollResult 1 6 4

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Roll ] [ text "roll" ]
    , div [] [ text (toString model) ]
    ]