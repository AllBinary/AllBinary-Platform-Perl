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

package org::allbinary::logic::communication::log::config::LoggingInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $INITFILENAME = "logConfig.xml";
our $PACKAGE = 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH};
our $logConfigInfoList = undef;
our $hasRead = 0;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getDoc {
    my ($class) = @_;
        my $path = 'org::allbinary::globals::URLGLOBALS'->getWebappPath() + $org::allbinary::logic::communication::log::config::LoggingInitInfo::PACKAGE;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new($path, $INITFILENAME);
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create('org::allbinary::logic::io::AbFileLocalInputStream'->new($file));
        return $document;
}


# throws Exception
sub write {
    my ($class) = @_;
        try {
            $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = 0;
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub read {
    my ($class) = @_;
        try {
            my $document = 'org::allbinary::logic::communication::log::config::LoggingInitInfo'->getDoc();
            my $logConfigsNodeList = $document->getElementsByTagName('org::allbinary::logic::communication::log::config::LogConfigsData'->getInstance()->{NAME});
            my $logConfigsNode = $logConfigsNodeList->item(0);
            my $logConfigNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::communication::log::config::LogConfigData'->getInstance()->{NAME}, $logConfigsNode->getChildNodes());
            $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList = 'org::allbinary::util::BasicArrayListD'->new();
            my $size = $logConfigNodeVector->size();
            for (my $i = 0; $i < $size; $i++) {
                my $node = $logConfigNodeVector->get($i);
                my $logConfigInfo = 'org::allbinary::logic::communication::log::config::LogConfig'->new($node);
                $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->add($logConfigInfo);
            }
        } catch ($e) {
            die $e;
        }
}


sub setHasRead {
    my ($class, $value) = @_;
        $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = $value;
}


# throws Exception
sub updateIfNeeded {
    my ($class) = @_;
        if (!$org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead) {
            'org::allbinary::logic::communication::log::config::LoggingInitInfo'->read();
            $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = 1;
            if (!defined($org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList)) {
                die ("Read Failed");
            }
        }
}


sub isValid {
    my ($self) = @_;
        try {
            return 1;
        } catch ($e) {
            return 0;
        }
}


sub set {
    my ($class, $logConfigInfoVector) = @_;
        $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList = $logConfigInfoVector;
}


# throws Exception
sub get {
    my ($class) = @_;
        'org::allbinary::logic::communication::log::config::LoggingInitInfo'->updateIfNeeded();
        return $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList;
}


# throws Exception
sub getTypeNameList {
    my ($class) = @_;
        'org::allbinary::logic::communication::log::config::LoggingInitInfo'->updateIfNeeded();
        my $allLogTypeVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->size();
        for (my $index = 0; $index < $size; $index++) {
            my $logConfigInfo = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->{objectArray}->[$index];
            my $logTypeVector = $logConfigInfo->getTypeVector();
            if ($logConfigInfo->isEnabled()) {
                $allLogTypeVector->addAllList($logTypeVector);
            }
        }
        return $allLogTypeVector;
}


# throws Exception
sub getTypeList {
    my ($class) = @_;
        'org::allbinary::logic::communication::log::config::LoggingInitInfo'->updateIfNeeded();
        my $allLogTypeVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->size();
        for (my $index = 0; $index < $size; $index++) {
            my $logConfigInfo = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->{objectArray}->[$index];
            my $logTypeVector = $logConfigInfo->getTypeVector();
            if ($logConfigInfo->isEnabled()) {
                $allLogTypeVector->addAllList($logTypeVector);
            }
        }
        return $allLogTypeVector;
}


# throws Exception
sub getNumberOfLogConfigs {
    my ($self) = @_;
        return $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->size();
}


sub toString {
    my ($self) = @_;
        try {
            my $document = 'org::allbinary::logic::communication::log::config::LoggingInitInfo'->getDoc();
            return 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document);
        } catch ($e) {
            return "Error";
        }
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::io::AbFileLocalInputStream;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::log::config::LogConfigsData;
use org::allbinary::logic::communication::log::config::LogConfigData;
use org::allbinary::logic::communication::log::config::LogConfig;

1;

