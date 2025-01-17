﻿namespace HamraKitab.Models.DTO
{
    public class PaginatedBookResponseDto<T>
    {
        public IEnumerable<T> Items { get; set; } = new List<T>();  // Initialize to empty list
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        public int TotalCount { get; set; }
        public bool HasNextPage { get; set; }
        public bool HasPreviousPage { get; set; }
    }
}
