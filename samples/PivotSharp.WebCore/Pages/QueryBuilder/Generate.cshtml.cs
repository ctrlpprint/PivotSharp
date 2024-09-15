using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class GenerateModel : PageModel
{
	// Use this to accept a JSON serialization of the config and redirect to ViewByConfig.
	public void OnGet(string config) {
		PivotConfig pivotConfig = JsonSerializer.Deserialize<PivotConfig>(config)!;

		// Will pass the object, but it'll call ToString() on the lists, which isn't pretty.
		// return RedirectToAction("ViewByConfig", config);

		// Comes through as nul;
		// return RedirectToAction("ViewByConfig", new {config = config});

		TempData["Config"] = pivotConfig;
		RedirectToAction("ViewByConfig");
	}
}
