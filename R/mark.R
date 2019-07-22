#' Mark Active Line
#'
#' Marks the active line in the RStudio Source Editor.
#'
#' The RStudio IDE has two keyboard shortcuts associated with the
#' `Ctrl+Shift+L` keyboard binding: one marks the active line in the source
#' editor, and the other launches `devtools::load_all()` whenever the `.Rproj`
#' file specifies `BuildType: Package`.
#'
#' During package development, the latter masks the former. Unfortunately,
#' the RStudio IDE does not expose the line marking shortcut, making it
#' impossible to assign a new keyboard binding to it.
#'
#' This function mimics the behaviour of the line marking shortcut. The package
#' then exposes this functionality to the RStudio IDE via an addin that can be
#' used to set the new keyboard shortcut.
#'
#' @export
mark <- function() {

  source_context <- rstudioapi::getSourceEditorContext()

  start_range <- source_context[["selection"]][[1]][["range"]]

  row_start <- start_range[["start"]]["row"]
  row_end   <- start_range[["end"]][["row"]] + 1

  end_range <- rstudioapi::document_range(c(row_start, 1), c(row_end, 1))

  rstudioapi::setSelectionRanges(
    ranges = end_range,
    id = source_context[["id"]]
    )

}
