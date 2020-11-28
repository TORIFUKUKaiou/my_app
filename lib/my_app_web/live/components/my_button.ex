defmodule MyAppWeb.Components.MyButton do
  use Surface.Component

  prop loading, :boolean
  prop rounded, :boolean

  def render(assigns) do
    ~H"""
    <button class={{ "button", "is-info", "is-loading": @loading, "is-rounded": @rounded }}>
      <slot/>
    </button>
    """
  end
end
