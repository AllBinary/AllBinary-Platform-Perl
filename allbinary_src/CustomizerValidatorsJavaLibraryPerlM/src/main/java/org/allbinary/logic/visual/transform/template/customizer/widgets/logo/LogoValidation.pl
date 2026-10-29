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

package org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{logoFileItem} = undef;
    $self->{logoAbPath} = undef;
    $self->{logoFile} = undef;
    $self->{isFile} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of LogoValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{isFile} = 0;
        $self->{logoAbPath} = undef;
        $self->{logoFile} = undef;
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{isFile} = 0;
        $self->{logoAbPath} = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEPATH}, $node->getChildNodes())->getNodeValue(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{logoFile} = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEFILENAME}, $node->getChildNodes())->getNodeValue();
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{isFile} = 1;
        $self->getFormData($hashMap);
    return $self;
}


# throws Exception
sub getFormData {
    my ($self, $hashMap) = @_;
        $self->{logoFileItem} = $hashMap->get('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGE});
        $self->{logoAbPath} = 'org::allbinary::logic::io::path::AbPath'->new($hashMap->get('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEPATH}), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        if (defined($self->{logoFileItem})) {
            $self->{logoFile} = 'org::allbinary::logic::communication::http::request::HttpRequestUtil'->getInstance()->generateFileName($self->{logoFileItem}->getName());
        }
        if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("HashMap: ");
            $stringBuffer->append($hashMap->toString());
            $stringBuffer->append("\nLogoFileName: ");
            $stringBuffer->append($self->{logoFile});
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "getFormData()");
        }
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            my $fileData = 'org::allbinary::logic::io::file::FileData'->getInstance();
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("LogoValidation", $self, $self->{commonStrings}->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{logoAbPath}->toString(), 0, 512)) {
                if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("logoPath is invalid: " . $self->{logoAbPath}->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{logoFile}, $fileData->{MINLEN}, $fileData->{MAXLEN})) {
                if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("logoFile is invalid: " . $self->{logoFile}, $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            if ($self->{isFile}) {
                if (!defined($self->{logoFileItem})) {
                    return 0;
                }
                if ($self->{logoFileItem}->getSize() > $fileData->{MAXIMAGEFILESIZE} || $self->{logoFileItem}->getSize() < $fileData->{MINIMAGEFILESIZE}) {
                    if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        $self->{logUtil}->putF("Image File Is Not The Right Size. " . $fileData->{MINIMAGEFILESIZE} . "< > " . $fileData->{MAXIMAGEFILESIZE}, $self, $self->{commonStrings}->{IS_VALID});
                    }
                    return 0;
                }
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Logo Validation: " . $valid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Logo is not valid.");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub toHashMap {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGE}, $stringUtil->{EMPTY_STRING});
        if (defined($self->{logoFile})) {
            $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEPATH}, $self->{logoAbPath}->toString());
            $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEFILENAME}, $self->{logoFile});
        } else {
            $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEPATH}, undef);
            $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEFILENAME}, $self->{logoFile});
        }
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{NAME}, $hashMap);
}


# throws Exception
sub processLogoFile {
    my ($self) = @_;
        if ($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::logo::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Processing logoFile: ");
            $stringBuffer->append($self->{logoAbPath}->toString());
            $stringBuffer->append($self->{logoFile});
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "processLogoFile()");
        }
        'org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoImageFileUtil'->new($self->{logoAbPath}, $self->{logoFile})->saveFiles($self->{logoFileItem});
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::HttpRequestUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::io::file::FileData;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::apache::commons::fileupload::FileItem;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoImageFileUtil;

1;

