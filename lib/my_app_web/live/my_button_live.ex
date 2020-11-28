defmodule MyAppWeb.MyButtonLive do
  use Surface.LiveView

  alias MyAppWeb.Components.MyButton

  data loading, :boolean, default: false
  data rounded, :boolean, default: false

  def mount(_params, _session, socket) do
    socket = Surface.init(socket)
    {:ok, assign(socket, checkboxes: [])}
  end

  def render(assigns) do
    ~H"""
    <MyButton loading={{ @loading }} rounded={{ @rounded }}>
      Change my style!
    </MyButton>

    <form phx-change="check_changed" style="margin-top: 30px">
      <input type="hidden" name="checkboxes[]" value="" />
      <label class="checkbox">
        <input type="checkbox" name="checkboxes[]" value="loading" checked={{ @loading }}>
        Loading
      </label>
      <label class="checkbox" style="margin-left: 20px">
        <input type="checkbox" name="checkboxes[]" value="rounded" checked={{ @rounded }}>
        Rounded
      </label>
    </form>
    """
  end

  def handle_event("check_changed", %{"_target" => ["checkboxes"], "checkboxes" => checkboxes}, socket) do
    loading = Enum.any?(checkboxes, & &1 == "loading")
    rounded = Enum.any?(checkboxes, & &1 == "rounded")
    {:noreply, assign(socket, loading: loading, rounded: rounded)}
  end
end
