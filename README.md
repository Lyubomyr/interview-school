# Goji Labs Inteview Take-Home Project

For task description visit https://github.com/gojilabs/interview-school

Demo https://www.loom.com/share/2e81644adcaf445dbff5ce85f6c74a6c

## Assumptions
- User currently could or will be able to attend class #1 for example at Mon and skip it at Tue, instead visit another class at the same time at Tue. From this assumption DB architecture created more flexible(student associated with section_timing instead of section). From another hand it's easy to change UI to restrict students manipulate with sections(all section_timings at once) if needed.
- As restriction for this tasks was 4 hours I tried to made as much functionality as possible at this time skipping UI styling and security needs. So any user can use admin panel at top of the pages, but for student's there is separate fucntionlity starting from home page.
