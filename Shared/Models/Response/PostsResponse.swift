//
//  PostsResponse.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 8/4/22.
//

import Foundation

// MARK: - PostsResponse
struct PostsResponse: Decodable, Hashable {
    let kind: String?
    let data: PostsResponseData?
}

// MARK: - PostsResponseData
struct PostsResponseData: Decodable, Hashable {
    let after: String?
    let dist: Int?
    let modhash, geoFilter: String?
    let children: [Child]?
    let before: String?

    enum CodingKeys: String, CodingKey {
        case after, dist, modhash
        case geoFilter = "geo_filter"
        case children, before
    }
}

// MARK: - Child
struct Child: Decodable, Hashable, Identifiable {
    let id = UUID()
    let kind: String?
    let data: ChildData?
}

// MARK: - ChildData
struct ChildData: Decodable, Hashable {
    let approvedAtUTC: String?
    let subreddit: String?
    let selftext, authorFullname: String?
    let saved: Bool?
    let modReasonTitle: String?
    let gilded: Int?
    let clicked: Bool?
    let title: String?
    let subredditNamePrefixed: String?
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCSSClass: String?
    let downs: Int?
    let thumbnailHeight: Int?
    let topAwardedType: String?
    let hideScore: Bool?
    let name: String?
    let quarantine: Bool?
    let linkFlairTextColor: String?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: String?
    let ups, totalAwardsReceived: Int?
    let thumbnailWidth: Int?
    let authorFlairTemplateID: String?
    let isOriginalContent: Bool?
    let userReports: [String]?
    let isRedditMediaDomain, isMeta: Bool?
    let category: String?
    let linkFlairText: String?
    let canModPost: Bool?
    let score: Int?
    let approvedBy: String?
    let isCreatedFromAdsUI, authorPremium: Bool?
    let thumbnail: String?
    let authorFlairCSSClass: String?
    let postHint: String?
    let isSelf: Bool?
    let subredditType: String?
    let created: Int?
    let linkFlairType: String?
    let wls: Int?
    let removedByCategory, bannedBy: String?
    let authorFlairType: String?
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHTML: String?
    let likes, suggestedSort, bannedAtUTC: String?
    let urlOverriddenByDest: String?
    let viewCount: String?
    let archived, noFollow, isCrosspostable, pinned: Bool?
    let over18: Bool?
    let awarders: [String]?
    let mediaOnly: Bool?
    let linkFlairTemplateID: String?
    let canGild, spoiler, locked: Bool?
    let authorFlairText: String?
    let treatmentTags: [String]?
    let visited: Bool?
    let removedBy, modNote, distinguished: String?
    let subredditID: String?
    let authorIsBlocked: Bool?
    let modReasonBy, numReports, removalReason: String?
    let linkFlairBackgroundColor: String?
    let isRobotIndexable: Bool?
    let reportReasons: String?
    let author: String?
    let discussionType: String?
    let numComments: Int?
    let sendReplies: Bool?
    let whitelistStatus: String?
    let contestMode: Bool?
    let modReports: [String]?
    let authorPatreonFlair: Bool?
    let authorFlairTextColor: String?
    let permalink: String?
    let parentWhitelistStatus: String?
    let stickied: Bool?
    let url: String?
    let subredditSubscribers, createdUTC, numCrossposts: Int?
    let isVideo: Bool?
    let isGallery: Bool?
    let crosspostParent: String?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case authorFullname = "author_fullname"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case topAwardedType = "top_awarded_type"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case isCreatedFromAdsUI = "is_created_from_ads_ui"
        case authorPremium = "author_premium"
        case thumbnail
        case authorFlairCSSClass = "author_flair_css_class"
        case postHint = "post_hint"
        case isSelf = "is_self"
        case subredditType = "subreddit_type"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case urlOverriddenByDest = "url_overridden_by_dest"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case awarders
        case mediaOnly = "media_only"
        case linkFlairTemplateID = "link_flair_template_id"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited
        case removedBy = "removed_by"
        case modNote = "mod_note"
        case distinguished
        case subredditID = "subreddit_id"
        case authorIsBlocked = "author_is_blocked"
        case modReasonBy = "mod_reason_by"
        case numReports = "num_reports"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case isVideo = "is_video"
        case isGallery = "is_gallery"
        case crosspostParent = "crosspost_parent"
    }
}
