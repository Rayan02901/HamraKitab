using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Models;
using System;
using Action = HamraKitab.Models.Action;
using System.Reflection.Emit;

namespace HamraKitab.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        // DbSet for the Book model
        public DbSet<Book> Books { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Action> Actions { get; set; }
        public DbSet<Activity> Activities { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<FriendRequest> FriendRequests { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }
        public DbSet<UserProfilePhoto> UserProfilePhotos { get; set; }
        public DbSet<Friend> Friends { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // UserProfile Configuration
            builder.Entity<UserProfile>(entity =>
            {
                entity.HasKey(up => up.ProfileId);

                // Configure one-to-one relationship with ApplicationUser
                entity.HasOne(up => up.User)
                    .WithOne(au => au.Profile)
                    .HasForeignKey<UserProfile>(up => up.UserId)
                    .OnDelete(DeleteBehavior.Restrict);

                // Configure UserProfilePhotos relationship
                entity.HasMany(up => up.UserProfilePhotos)
                    .WithOne(upp => upp.UserProfile)
                    .HasForeignKey(upp => upp.ProfileId)
                    .OnDelete(DeleteBehavior.Cascade);

                // Ensure UserId is unique
                entity.HasIndex(up => up.UserId)
                    .IsUnique();
            });

            // UserProfilePhoto Configuration
            builder.Entity<UserProfilePhoto>(entity =>
            {
                entity.HasKey(upp => upp.PhotoId);

                // Ensure only one main photo per profile
                entity.HasIndex(upp => new { upp.ProfileId, upp.IsMainPhoto })
                    .HasFilter("[IsMainPhoto] = 1")
                    .IsUnique();
            });

            // FriendRequest Configuration
            builder.Entity<FriendRequest>(entity =>
            {
                entity.HasKey(fr => fr.FriendRequestId);

                entity.HasOne(fr => fr.Requester)
                    .WithMany(u => u.SentFriendRequests)
                    .HasForeignKey(fr => fr.RequesterId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasOne(fr => fr.Recipient)
                    .WithMany(u => u.ReceivedFriendRequests)
                    .HasForeignKey(fr => fr.RecipientId)
                    .OnDelete(DeleteBehavior.Restrict);
            });

            // Friend Configuration
            builder.Entity<Friend>(entity =>
            {
                entity.HasKey(f => f.FriendId);

                entity.HasOne(f => f.User)
                    .WithMany(u => u.Friends)
                    .HasForeignKey(f => f.UserId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasOne(f => f.FriendUser)
                    .WithMany()
                    .HasForeignKey(f => f.FriendUserId)
                    .OnDelete(DeleteBehavior.Restrict);

                // Ensure unique friendships
                entity.HasIndex(f => new { f.UserId, f.FriendUserId }).IsUnique();
            });

            // Book Configuration
            builder.Entity<Book>(entity =>
            {
                entity.HasKey(b => b.Id);

                entity.Property(b => b.Rating)
                    .HasColumnType("decimal(3,2)");

                entity.HasOne(b => b.User)
                    .WithMany(u => u.Books)
                    .HasForeignKey(b => b.UserId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasOne(b => b.Genre)
                    .WithMany(g => g.Books)
                    .HasForeignKey(b => b.GenreId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasMany(b => b.Reviews)
                    .WithOne(r => r.Book)
                    .HasForeignKey(r => r.BookId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            // Review Configuration
            builder.Entity<Review>(entity =>
            {
                entity.HasKey(r => r.ReviewId);

                entity.HasOne(r => r.User)
                    .WithMany(u => u.Reviews)
                    .HasForeignKey(r => r.UserId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasIndex(r => new { r.BookId, r.UserId }).IsUnique();
            });

            // Activity Configuration
            builder.Entity<Activity>(entity =>
            {
                entity.HasKey(a => a.ActivityId);

                entity.HasOne(a => a.User)
                    .WithMany(u => u.Activities)
                    .HasForeignKey(a => a.UserId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasOne(a => a.Book)
                    .WithMany(b => b.Activities)
                    .HasForeignKey(a => a.BookId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.HasOne(a => a.Action)
                    .WithMany(ac => ac.Activities)
                    .HasForeignKey(a => a.ActionId)
                    .OnDelete(DeleteBehavior.Restrict);

                entity.Property(a => a.CreatedAt)
                    .HasDefaultValueSql("GETUTCDATE()");
            });

            // Action Configuration
            builder.Entity<Action>(entity =>
            {
                entity.HasKey(a => a.ActionId);

                entity.Property(a => a.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });
            builder.Entity<Genre>()
    .Navigation(g => g.Books)
    .UsePropertyAccessMode(PropertyAccessMode.Property);


            // Seed roles
            builder.Entity<IdentityRole>().HasData(
                new IdentityRole
                {
                    Id = "USER_ROLE_ID",
                    Name = "User",
                    NormalizedName = "USER"
                },
                new IdentityRole
                {
                    Id = "ADMIN_ROLE_ID",
                    Name = "Admin",
                    NormalizedName = "ADMIN"
                }
            );

            // Seed genres
            builder.Entity<Genre>().HasData(
                new Genre { GenreId = Guid.Parse("5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a"), GenreName = "Sci Fiction" },
                new Genre { GenreId = Guid.Parse("2f774fae-3b8c-4ec2-9b5e-720c7ed9e115"), GenreName = "Horror" },
                new Genre { GenreId = Guid.Parse("52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6"), GenreName = "Adventure" },
                new Genre { GenreId = Guid.Parse("643f9871-c21f-4095-a2e7-648f71fb3ed5"), GenreName = "Historical Fiction" },
                new Genre { GenreId = Guid.Parse("bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5"), GenreName = "Mystery & Thriller" },
                new Genre { GenreId = Guid.Parse("fdd6275b-20f9-4879-b1c9-b37b502d21ab"), GenreName = "Epic Fantasy" },
                new Genre { GenreId = Guid.Parse("d23564cc-1bbd-451f-bdc6-3474413f865b"), GenreName = "Classics" },
                new Genre { GenreId = Guid.Parse("5db27ab4-6a99-47ff-b0f1-b9ba12a16818"), GenreName = "Best Books Ever" },
                new Genre { GenreId = Guid.Parse("3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f"), GenreName = "2000s" },
                new Genre { GenreId = Guid.Parse("f63b8585-80a1-4186-87a1-d0c0f26fcb47"), GenreName = "History" },
                new Genre { GenreId = Guid.Parse("798ca2c6-8d53-44ec-95b6-d23f59d3f573"), GenreName = "19th Century" },
                new Genre { GenreId = Guid.Parse("af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c"), GenreName = "1960s" },
                new Genre { GenreId = Guid.Parse("7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a"), GenreName = "1970s" },
                new Genre { GenreId = Guid.Parse("f4229e1c-6fc1-4d77-9180-5a89f37a5f65"), GenreName = "1990s" }
            );

            // Seed actions
            builder.Entity<Action>().HasData(
                new Action { ActionId = Guid.Parse("8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b"), Name = "Want to Read" },
                new Action { ActionId = Guid.Parse("b11ac0d4-ff79-4024-bcd5-32bf2e6d252d"), Name = "Read" },
                new Action { ActionId = Guid.Parse("e2ccf236-783f-42bc-bbb5-f72dd850d614"), Name = "Started" }
            );
        }
    }
}