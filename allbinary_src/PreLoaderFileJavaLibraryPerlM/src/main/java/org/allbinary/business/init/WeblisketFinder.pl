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

package org::allbinary::business::init::WeblisketFinder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::WeblisketFinder'->new();
our $KEY = "installerdata.dat";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{subDirectory} = 'org::allbinary::logic::io::file::directory::SubDirectory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::init::WeblisketFinder::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub findAll {
    my ($self, $path) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "findAll");
            return $self->{subDirectory}->search($org::allbinary::business::init::WeblisketFinder::KEY, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "findAll", $e);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "findAll", $e);
            }
            return undef;
        }
}


sub getInstallationPath {
    my ($self, $file) = @_;
        try {
            my $filePath = $file->getPath();
            my $end = index($filePath, $KEY);
            if ($end < 0) {
                return undef;
            }
            return substr($filePath, 0, ($end) - (0));
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstallationPath", $e);
            }
            return undef;
        }
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $vector = 'org::allbinary::business::init::WeblisketFinder'->getInstance()->findAll($stringUtil->{EMPTY_STRING});
        print($vector->size(), "\n");
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::directory::SubDirectory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use java::lang::System;

1;

