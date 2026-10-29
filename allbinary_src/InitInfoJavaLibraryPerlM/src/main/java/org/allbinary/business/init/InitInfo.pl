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

package org::allbinary::business::init::InitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::InitInfo'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TESTING} = "TESTING";
    $self->{MAINPATH} = "MAINPATH";
    $self->{TESTHTMLPATH} = "TESTHTMLPATH";
    $self->{testing} = undef;
    $self->{mainPath} = undef;
    $self->{testHtmlPath} = undef;
    $self->{hasRead} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::init::InitInfo::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws InitException
sub set {
    my ($self) = @_;
        try {
            my $initInfoEntity = 'org::allbinary::business::init::InitInfoEntity'->new();
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("created entity", "InitInfo", "set()");
            }
            if (!$initInfoEntity->is()) {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("adding", "InitInfo", "set()");
                }
                $initInfoEntity->add();
            } else {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("update", "InitInfo", "set()");
                }
                $initInfoEntity->update();
            }
            $self->{hasRead} = 0;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("error", "InitInfo", "set()", $e);
            }
        }
}


# Java overloaded method: Perl keeps the last definition
sub set {
    my ($self, $hashMap) = @_;
        try {
            $self->{testing} = $hashMap->get($self->{TESTING});
            $self->{mainPath} = 'org::allbinary::logic::io::path::AbPath'->new($hashMap->get($self->{MAINPATH}), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $self->{testHtmlPath} = 'org::allbinary::logic::io::path::AbPath'->new($hashMap->get($self->{TESTHTMLPATH}), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("error", "InitInfo", "set()", $e);
            }
        }
}


sub get {
    my ($self) = @_;
        try {
            $self->{testing} = undef;
            $self->{mainPath} = undef;
            $self->{testHtmlPath} = undef;
            my $initInfoEntity = 'org::allbinary::business::init::InitInfoEntity'->new();
            $initInfoEntity->get();
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("error", "InitInfo", "set()", $e);
            }
            return;
        }
}


sub setHasRead {
    my ($self, $value) = @_;
        $self->{hasRead} = $value;
}


sub updateIfNeeded {
    my ($self) = @_;
        try {
            if (!$self->{hasRead}) {
                $self->{hasRead} = 1;
                $self->get();
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("error", "InitInfo", "updateIfNeeded()", $e);
            }
            return;
        }
}


sub isTesting {
    my ($self) = @_;
        try {
            $self->updateIfNeeded();
            return 'org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($self->{testing});
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("error", "InitInfo", "updateIfNeeded()", $e);
            }
            return 0;
        }
}


sub getTesting {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $self->{testing};
}


sub getTestHtmlPath {
    my ($self) = @_;
        $self->updateIfNeeded();
        if (defined($self->{testHtmlPath})) {
            return $self->{testHtmlPath}->toString();
        } else {
            return undef;
        }
}


sub getMainPath {
    my ($self) = @_;
        $self->updateIfNeeded();
        if (defined($self->{mainPath})) {
            return $self->{mainPath}->toString();
        } else {
            return undef;
        }
}


sub setTesting {
    my ($self, $value) = @_;
        $self->{testing} = $value;
}


sub setTestHtmlPath {
    my ($self, $value) = @_;
        $self->{testHtmlPath} = $value;
}


sub setMainPath {
    my ($self, $value) = @_;
        $self->{mainPath} = $value;
}


sub isMainPathValid {
    my ($self, $abPath) = @_;
        return 1;
}


sub isTestHtmlPathValid {
    my ($self, $abPath) = @_;
        return 1;
}


# throws Exception
sub isTestingValid {
    my ($self, $testing) = @_;
        return 'org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->isStringBoolean($testing);
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($self->{TESTING}, $self->getTesting());
        $hashMap->put($self->{MAINPATH}, $self->getMainPath());
        $hashMap->put($self->{TESTHTMLPATH}, $self->getTestHtmlPath());
        return $hashMap;
}

use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::java::bool::BooleanUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::business::init::InitInfoEntity;

1;

