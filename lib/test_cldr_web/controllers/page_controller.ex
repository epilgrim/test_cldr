defmodule TestCldrWeb.PageController do
  use TestCldrWeb, :controller
  alias Appsignal.Transaction
  import TestCldrWeb.Gettext
  import Cldr

  def index(conn, _params) do
    Cldr.set_current_locale("de")
    render conn, "index.html"
  end
end
