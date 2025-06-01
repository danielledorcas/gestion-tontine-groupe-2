class URLDebugMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        try:
            response = self.get_response(request)
            return response
        except Exception as e:
            import traceback
            print("="*80)
            print("ERREUR DÉTECTÉE DANS L'APPLICATION:")
            traceback.print_exc()
            print("="*80)
            raise