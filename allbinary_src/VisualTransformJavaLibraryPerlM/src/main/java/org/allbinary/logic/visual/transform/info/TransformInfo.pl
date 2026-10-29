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

package org::allbinary::logic::visual::transform::info::TransformInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{isChild} = 0;
    $self->{name} = undef;
    $self->{storeName} = undef;
    $self->{objectFileName} = undef;
    $self->{anyType} = undef;
    $self->{objectConfigFileName} = undef;
    $self->{objectConfigInterface} = undef;
    $self->{template} = undef;
    $self->{templateFileName} = undef;
    $self->{dataFileName} = undef;
    $self->{data} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new5(@arguments) if scalar(@arguments) == 5;
    die "No constructor of TransformInfo takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
    return $self;
}


sub _new5 {
    my ($class, $name, $objectFileName, $objectConfigFileName, $templateFileName, $dataFileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->setObjectFile($objectFileName);
        $self->setObjectConfigFile($objectConfigFileName);
        $self->setTemplateFile($templateFileName);
        $self->setDataFile($dataFileName);
    return $self;
}


# throws Exception
sub override {
    my ($self, $hashMap) = @_;
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $aName = $hashMap->get($transformInfoData->{NAME});
        if (!$stringValidationUtil->isEmpty($aName)) {
            $self->{name} = $aName;
        }
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("TransformInfo properties overridden for: ");
            $stringBuffer->append($self->getName());
            $stringBuffer->append("\n properties: ");
            $stringBuffer->append($hashMap->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "override(HashMap hashMap)");
        }
        my $aStoreName = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (!$stringValidationUtil->isEmpty($aStoreName)) {
            $self->{storeName} = $aStoreName;
        }
        my $aObjectFileName = $hashMap->get($transformInfoData->{OBJECTFILENAME});
        if (!$stringValidationUtil->isEmpty($aObjectFileName)) {
            $self->{objectFileName} = $aObjectFileName;
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($self->{storeName});
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $fileAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $aObject = $hashMap->get($transformInfoData->{OBJECT});
        if (!$stringValidationUtil->isEmpty($aObject)) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TransformInfo override view Object for: " . $self->getName(), $self, "override(HashMap hashMap)");
            }
            my $fileDataString = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::viewObject::TransformInfoObjectData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::viewObject::TransformInfoObjectData'->getInstance()->{ENCRYPTED_EXTENSION})->get('org::allbinary::logic::io::path::AbPath'->new($fileAbPath->toString(), $aObject));
            if (defined($fileDataString)) {
                $self->{anyType} = $fileDataString;
            }
        }
        if (!$stringValidationUtil->isEmpty($hashMap->get($transformInfoData->{OBJECTCONFIG}))) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TransformInfo override ObjectConfig for: " . $self->getName(), $self, "override(HashMap hashMap)");
            }
            $self->setObjectConfig($hashMap->get($transformInfoData->{OBJECTCONFIG}));
        }
        my $objectConfigFileName = $hashMap->get($transformInfoData->{OBJECTCONFIGFILENAME});
        if (!$stringValidationUtil->isEmpty($objectConfigFileName)) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TransformInfo override ObjectConfig File for: " . $self->getName(), $self, "override(HashMap hashMap)");
            }
            $self->setObjectConfigFile($objectConfigFileName);
        }
        my $type = $hashMap->get('org::allbinary::logic::io::OutputTypeData'->getInstance()->{NAME});
        if (!$stringValidationUtil->isEmpty($type)) {
            if (!defined($self->getObjectConfigInterface())) {
                $self->setObjectConfigInterface('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($self));
            }
            $self->getObjectConfigInterface()->setOutputTypeName($type);
        }
        my $aTemplateFileName = $hashMap->get($transformInfoData->{TEMPLATEFILENAME});
        if (!$stringValidationUtil->isEmpty($aTemplateFileName)) {
            $self->{templateFileName} = $aTemplateFileName;
        }
        my $aTemplate = $hashMap->get($transformInfoData->{TEMPLATE});
        if (!$stringValidationUtil->isEmpty($aTemplate)) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TransformInfo override Template for: " . $self->getName(), $self, "override(HashMap hashMap)");
            }
            my $fileDataString = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{ENCRYPTED_EXTENSION})->get('org::allbinary::logic::io::path::AbPath'->new($fileAbPath->toString(), $aTemplate));
            if (!$stringValidationUtil->isEmpty($fileDataString)) {
                $self->{template} = $fileDataString;
            }
        }
        my $aDataFileName = $hashMap->get($transformInfoData->{DATAFILENAME});
        if (!$stringValidationUtil->isEmpty($aDataFileName)) {
            $self->{dataFileName} = $aDataFileName;
        }
        my $aData = $hashMap->get($transformInfoData->{DATA});
        if (!$stringValidationUtil->isEmpty($aData)) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TransformInfo override Data for: " . $self->getName(), $self, "override(HashMap hashMap)");
            }
            my $fileDataString = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::data::TransformInfoDataData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::data::TransformInfoDataData'->getInstance()->{ENCRYPTED_EXTENSION})->get('org::allbinary::logic::io::path::AbPath'->new($fileAbPath->toString(), $aData));
            if (!$stringValidationUtil->isEmpty($fileDataString)) {
                $self->{data} = $fileDataString;
            }
        }
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Name: ");
            $stringBuffer->append($aName);
            $stringBuffer->append("\nTemp Object File: ");
            $stringBuffer->append($aObject);
            $stringBuffer->append("\nTemp Object Config File: ");
            $stringBuffer->append($self->getObjectConfigFilePath()->toString());
            $stringBuffer->append("\nTemp Template File: ");
            $stringBuffer->append($aTemplate);
            $stringBuffer->append("\nTemp Data File: ");
            $stringBuffer->append($aData);
            $stringBuffer->append("\nStore Name: ");
            $stringBuffer->append($aStoreName);
            $stringBuffer->append("\nObjectFile: ");
            $stringBuffer->append($self->getObjectFile());
            $stringBuffer->append("->TransformInfo");
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "TransformInfoInterface(HashMap)");
        }
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
            $self->{logUtil}->putF($self->log(), $self, "override");
        }
}


sub log {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Name: ");
        $stringBuffer->append($self->{name});
        $stringBuffer->append("\nObject File: ");
        $stringBuffer->append($self->{objectFileName});
        $stringBuffer->append("\nObject Config File Path: ");
        $stringBuffer->append($self->getObjectConfigFile());
        $stringBuffer->append("\nTemplate File: ");
        $stringBuffer->append($self->{templateFileName});
        $stringBuffer->append("\nData File: ");
        $stringBuffer->append($self->{dataFileName});
        $stringBuffer->append("\nStore Name: ");
        $stringBuffer->append($self->{storeName});
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append($self->getObjectFile());
        $stringBuffer->append("->TransformInfo");
        $stringBuffer->append("TransformInfoInterface(HashMap)");
        return $stringBuffer->toString();
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub setObject {
    my ($self, $anyType) = @_;
        $self->{anyType} = $anyType;
}


sub setObjectFile {
    my ($self, $value) = @_;
        $self->{objectFileName} = $value;
}


sub setTemplate {
    my ($self, $value) = @_;
        $self->{template} = $value;
}


sub setTemplateFile {
    my ($self, $value) = @_;
        $self->{templateFileName} = $value;
}


# throws Exception
sub setObjectConfigFileName {
    my ($self, $value) = @_;
        $self->{objectConfigFileName} = $value;
}


# throws Exception
sub setObjectConfigFile {
    my ($self, $value) = @_;
        $self->{objectConfigFileName} = $value;
        $self->setObjectConfigInterface('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory'->getInstance()->getInstance($self->{abeClientInformation}, $self, $self->getObjectConfigFilePath()));
}


# throws Exception
sub setObjectConfig {
    my ($self, $value) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($value);
        $self->setObjectConfigInterface('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory'->getInstance()->getInstance($self->{abeClientInformation}, $self, $document));
}


sub setDataFile {
    my ($self, $value) = @_;
        $self->{dataFileName} = $value;
}


sub setData {
    my ($self, $value) = @_;
        $self->{data} = $value;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getObject {
    my ($self) = @_;
        return $self->{anyType};
}


sub getObjectFile {
    my ($self) = @_;
        return $self->{objectFileName};
}


sub getTemplate {
    my ($self) = @_;
        return $self->{template};
}


sub getTemplateFile {
    my ($self) = @_;
        return $self->{templateFileName};
}


# throws Exception
sub getTemplateFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbFilePath'->new($self->getTemplateFile());
}


# throws Exception
sub getObjectConfigFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbFilePath'->new($self->getObjectConfigFile());
}


# throws Exception
sub getDataFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbFilePath'->new($self->getDataFile());
}


sub getObjectConfigFile {
    my ($self) = @_;
        return $self->{objectConfigFileName};
}


sub getData {
    my ($self) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $dataFileString = $self->getDataFile();
        if (!$stringValidationUtil->isEmpty($dataFileString)) {
            try {
                my $fileData = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::data::TransformInfoDataData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::data::TransformInfoDataData'->getInstance()->{ENCRYPTED_EXTENSION})->get($self->getDataFilePath());
                if (!$stringValidationUtil->isEmpty($self->{data})) {
                    if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        $self->{logUtil}->putF("Data File overriding existing data: " . $self->getDataFilePath(), $self, "getData()");
                    }
                }
                $self->{data} = $fileData;
            } catch ($e) {
                if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                    $self->{logUtil}->put("Could Not Load Data from: " . $self->getDataFile(), $self, "getData()", $e);
                }
            }
        }
        try {
            if (!$stringValidationUtil->isEmpty($self->{data})) {
                if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                    $self->{logUtil}->putF("Data: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString('org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($self->{data})), $self, "getData()");
                }
            } else {
                if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Name: ");
                    $stringBuffer->append($self->{name});
                    $stringBuffer->append("\nEmpty Data For: ");
                    $stringBuffer->append($dataFileString);
                    $stringBuffer->append("\nPath: ");
                    $stringBuffer->append($self->getDataFilePath()->toFileSystemString());
                    if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, "getData()");
                    }
                }
            }
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Could Not Preview Data: " . $self->{data}, $self, "getData()", $e);
            }
        }
        return $self->{data};
}


# throws Exception
sub getDataDocument {
    my ($self) = @_;
        my $localData = $self->getData();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($localData)) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->putF("No Data So Creating New Document", $self, "getDataDocument()");
            }
            return 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        } else {
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($localData);
            return $document;
        }
}


sub getDataFile {
    my ($self) = @_;
        return $self->{dataFileName};
}


sub toHashMap {
    my ($self) = @_;
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($transformInfoData->{NAME}, $self->{name});
        $hashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
        $hashMap->put($transformInfoData->{OBJECTFILENAME}, $self->{objectFileName});
        $hashMap->put($transformInfoData->{OBJECT}, $self->{anyType});
        $hashMap->put($transformInfoData->{OBJECTCONFIGFILENAME}, $self->getObjectConfigFile());
        $hashMap->put($transformInfoData->{OBJECTCONFIG}, 'org::allbinary::logic::control::crypt::Encoder'->encode([unpack("C*", $self->getObjectConfigInterface()->toString())]));
        $hashMap->put($transformInfoData->{TEMPLATEFILENAME}, $self->{templateFileName});
        $hashMap->put($transformInfoData->{TEMPLATE}, $self->{template});
        $hashMap->put($transformInfoData->{DATAFILENAME}, $self->{dataFileName});
        $hashMap->put($transformInfoData->{DATA}, 'org::allbinary::logic::control::crypt::Encoder'->encode([unpack("C*", $self->{data})]));
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $hashMap;
}


sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->{name});
        $vector->add($self->{storeName});
        $vector->add($self->{objectFileName});
        $vector->add($self->{anyType});
        $vector->add($self->getObjectConfigFile());
        $vector->add('org::allbinary::logic::control::crypt::Encoder'->encode([unpack("C*", $self->getObjectConfigInterface()->toString())]));
        $vector->add($self->{templateFileName});
        $vector->add($self->{template});
        $vector->add($self->{dataFileName});
        $vector->add('org::allbinary::logic::control::crypt::Encoder'->encode([unpack("C*", $self->{data})]));
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $vector->add($time);
        $vector->add($time);
        return $vector;
}


sub getKey {
    my ($self) = @_;
        return $self->getName();
}


sub setChild {
    my ($self) = @_;
        $self->{isChild} = 1;
}


sub isChild {
    my ($self) = @_;
        return $self->{isChild};
}


sub getObjectConfigInterface {
    my ($self) = @_;
        return $self->{objectConfigInterface};
}


sub setObjectConfigInterface {
    my ($self, $objectConfigInterface) = @_;
        $self->{objectConfigInterface} = $objectConfigInterface;
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::Encoder;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::OutputTypeData;
use org::allbinary::logic::io::path::AbFilePath;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::info::data::TransformInfoDataData;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData;
use org::allbinary::logic::visual::transform::info::viewObject::TransformInfoObjectData;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoData;

1;

