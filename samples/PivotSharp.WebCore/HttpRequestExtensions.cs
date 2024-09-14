namespace Microsoft.AspNetCore.Mvc;

public static class HttpRequestExtensions
{
    public static bool IsAjaxRequest(this HttpRequest request) {
        return request == null
            ? throw new ArgumentNullException(nameof(request))
            : (request.Headers != null) && (request.Headers["X-Requested-With"] == "XMLHttpRequest");
    }
}