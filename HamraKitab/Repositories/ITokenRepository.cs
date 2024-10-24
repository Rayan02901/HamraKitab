using Microsoft.AspNetCore.Identity;

namespace HamraKitab.Repositories
{
    public interface ITokenRepository
    {
       string CreateJWTToken(IdentityUser user, string role);
    }
}
