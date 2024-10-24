namespace HamraKitab.Models
{
    public class Action
    {
        public Guid ActionId { get; set; }
        public string Name { get; set; }

        // Navigation property
        public virtual ICollection<Activity> Activities { get; set; }

        public Action()
        {
            Activities = new HashSet<Activity>();
        }
    }
}
