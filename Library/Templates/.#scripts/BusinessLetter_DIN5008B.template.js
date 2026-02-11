//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; Header@0@ContainerPartRef0@StaticContainer1@Section0@Document0@RootPart@.library.DIN5008.Vorlagen.Brief.template@.script
$Letter.Header

//__Script: //Framework/DocumentParts/Logo.model; @@Framework@DocumentParts@Logo.model@@Image0@Container0@ContainerPart0@.dataUri
$Header.GraphicFilename

//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; Line@0@ContainerPartRef0@StaticContainer2@Section0@Document0@RootPart@.library.DIN5008.Vorlagen.Brief.template@.script
$Letter.Sender.Address.SingleLine

//__Script: //Framework/DocumentParts/SenderAdressLine.model; @@Framework@DocumentParts@SenderAdressLine.model@@Data2@Span0@Par1@Container0@ContainerPart0@.script
$Line

//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; Date@0@ContainerPartRef0@StaticContainer3@Section0@Document0@RootPart@.library.DIN5008.Vorlagen.Brief.template@.script
$Letter.Date

//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; ContactDetails@1@ContainerPartRef0@StaticContainer3@Section0@Document0@RootPart@.library.DIN5008.Vorlagen.Brief.template@.script
$Letter.ContactDetails

//__Script: //Framework/DocumentParts/ContactDetails.model; @@Framework@DocumentParts@ContactDetails.model@@ContainerPart0@Container0@ContainerPart0@.forEach
$ContactDetails.Line

//__Script: //Framework/DocumentParts/ContactDetails.model; @@Framework@DocumentParts@ContactDetails.model@@Data2@Span0@Par0@ContainerPart0@Container0@ContainerPart0@.script
$Line

//__Script: //Framework/DocumentParts/ContactDetails.model; @@Framework@DocumentParts@ContactDetails.model@@Data2@Span0@Par0@ContainerPart@DatumText@.script
$Date

//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; Address@0@ContainerPartRef0@StaticContainer4@Section0@Document0@RootPart@.library.DIN5008.Vorlagen.Brief.template@.script
$Letter.Recipient.Address

//__Script: //Framework/DocumentParts/RecipientAddress.model; @@Framework@DocumentParts@RecipientAddress.model@@ContainerPart0@Container@AnschriftText@.forEach
$Address.Lines.Line

//__Script: //Framework/DocumentParts/RecipientAddress.model; @@Framework@DocumentParts@RecipientAddress.model@@Data2@Span0@Par0@ContainerPart0@Container@AnschriftText@.script
$Line

//__Script: //Common/Vorlagen/BusinessLetter_DIN5008B.template; Letter@0@ContainerPartRef@BodyText@.script
$Letter

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@ContainerPart0@ContainerPart0@ContainerPart0@.forEach
$Letter.Subject.Line

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Data2@Span0@Par0@ContainerPart0@ContainerPart0@ContainerPart0@.script
$Line

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Data2@Span0@Par2@ContainerPart0@ContainerPart0@.script
$Letter.SalutatoryAddress

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Data2@Span0@Par6@ContainerPart0@ContainerPart0@.script
$Letter.ComplimentaryClose

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Image7@ContainerPart0@ContainerPart0@.dataUri
$Letter.Sender.FaksimileFilename

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Image7@ContainerPart0@ContainerPart0@.hyperlink
""

//__Script: //Framework/DocumentParts/TextBody.model; @@Framework@DocumentParts@TextBody.model@@Data2@Span0@Par8@ContainerPart0@ContainerPart0@.script
$Letter.Sender.FaksimileLabel
