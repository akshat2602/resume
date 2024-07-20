#import "template.typ": *

#let cvdata = yaml("data.yml")

#let uservars = (
    headingfont: "New Computer Modern",
    bodyfont: "New Computer Modern",
    fontsize: 12pt, // 10pt, 11pt, 12pt
    linespacing: 7pt,
    sectionspacing: 1pt,
    showAddress:  true, // true/false show address in contact info
    showNumber: true,  // true/false show phone number in contact info
    showTitle: false,   // true/false show title in heading
    headingsmallcaps: false, // true/false use small caps for headings
    sendnote: false, // set to false to have sideways endnote
)

// setrules and showrules can be overridden by re-declaring it here
// #let setrules(doc) = {
//      // add custom document style rules here
//
//      doc
// }

#let customrules(doc) = {
    // add custom document style rules here
    set page(
        paper: "us-letter", // a4, us-letter
        number-align: center, // left, center, right
        margin: 0.75cm, // 1.25cm, 1.87cm, 2.5cm
    )
    show link: set text(rgb(25%, 13%, 65%))
    // show link: underline

    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}

// each section body can be overridden by re-declaring it here
// #let cveducation = []

// ========================================================================== //

#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)
#cveducation(cvdata)
#cvskills(cvdata)
#cvwork(cvdata)
#cvprojects(cvdata)
// #cvaffiliations(cvdata)
// #cvawards(cvdata)
// #cvcertificates(cvdata)
// #cvpublications(cvdata)
// #cvreferences(cvdata)
#endnote(uservars)
