defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view
  alias Foster.QA
  # alias Foster.QA.Question


  # def mount(_params, _session, socket) do
  #   changeset = User.changeset(%User{})
  #   {:ok, assign(socket, changeset: changeset)}
  # end


  def render(assigns) do
    ~H"""
    <div>
      <div>
        Welcome to the Hackathon on Foster Care
      </div>
      <.simple_form
        for={}
        phx-submit="save"
        >
      <.label>Your Name</.label>
      <.input name="name" value="" placeholder="Name"/>
      <.label>Your Email</.label>
      <.input name="email" value="" placeholder="Name"/>

      <.label>Your Age</.label>
      <.input name="age" value="" placeholder="Name"/>

      <.label>Your Education</.label>
      <.input name="education" value="" placeholder="Name"/>

      <.label>Your Family Members</.label>
      <.input name="members" value="" placeholder="Name"/>
      <.label>Amount of spare Rooms</.label>
      <.button type="submit" phx-disable-with="Saving...">
          Submit
      </.button>
      </.simple_form>
    </div>
    """
  end


  def handle_event("save_field", user_data, socket) do
    IO.inspect(user_data)
    IO.inspect(socket)
    {:noreply,
     socket
     |>assign(user_data)}
     IO.inspect(socket)
  end

  def handle_event("save", user_data, socket) do
    # Handle form submission
    case QA.create_user!(user_data) do
      user ->
        {:noreply,
         socket
         |> put_flash(:info, "Created user successfully")
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
