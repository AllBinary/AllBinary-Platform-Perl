#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

#name="inputAutomationConfiguration", 
package org::allbinary::input::automation::configuration::InputAutomationConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $FILENAME = "InputAutomationConfig.xml";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{installed} = 0;
    $self->{inputAutomationModuleConfigurationList} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getFile {
    my ($class) = @_;
        return 'java::io::File'->new($FILENAME);
}


sub isInstalled {
    my ($self) = @_;
        return $self->{installed};
}


sub setInstalled {
    my ($self, $installed) = @_;
        $self->{installed} = $installed;
        $self->{logUtil}->putF("Installed: " . $installed, $self, "setIntalled");
}


sub getInputAutomationModuleConfigurationList {
    my ($self) = @_;
        return $self->{inputAutomationModuleConfigurationList};
}


# throws Exception
sub save {
    my ($self) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $file = 'java::io::File'->new($FILENAME);
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->copy('org::allbinary::logic::io::path::AbPath'->new($file->getAbsolutePath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}), 'org::allbinary::logic::io::path::AbPath'->new($file->getAbsolutePath() . ".bak.xml", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}));
        my $jaxbContext = 'javax::xml::bind::JAXBContext'->newInstance('org::allbinary::input::automation::configuration::InputAutomationConfiguration');
        my $marshaller = $jaxbContext->createMarshaller();
        $marshaller->setProperty($javax::xml::bind::Marshaller::JAXB_FORMATTED_OUTPUT, 1);
        $marshaller->marshal($self, $document);
        'org::allbinary::data::tree::dom::document::DomDocumentFileHelper'->save('org::allbinary::logic::io::file::FileWrapperUtil'->wrapFile($file), $document);
}

use java::io::File;
# use java::util::List;
# use javax::xml::bind::JAXBContext;
# use javax::xml::bind::Marshaller;
# use javax::xml::bind::annotation::XmlAccessType;
# use javax::xml::bind::annotation::XmlAccessorType;
# use javax::xml::bind::annotation::XmlElement;
# use javax::xml::bind::annotation::XmlRootElement;
# use javax::xml::bind::annotation::XmlType;
use org::allbinary::data::tree::dom::document::DomDocumentFileHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Document;

1;

