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

#Android
package org::allbinary::data::resource::ResourceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::resource::ResourceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{context} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{resources} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::resource::ResourceUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setLoadingPaths {
    my ($self, $path, $ext) = @_;
        $self->{logUtil}->putF('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED}, $self, "setLoadingPaths");
}


sub getContext {
    my ($self) = @_;
        return $self->{context};
}


sub setContextFromActivity {
    my ($self, $activity) = @_;
        $self->{context} = $activity;
}


sub setContext {
    my ($self, $aContext) = @_;
        $self->{context} = $aContext;
}


sub getResourceId {
    my ($self, $resource) = @_;
        my $value = $self->{hashMap}->get($resource);
        if ('org::allbinary::debug::DebugFactory'->getInstance() != 'org::allbinary::debug::NoDebug'->getInstance()) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($resource)->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(("" . ($value)))->toString(), $self, "getResourceId");
        }
        return $value;
}


sub addResource {
    my ($self, $resource, $value) = @_;
        if ('org::allbinary::debug::DebugFactory'->getInstance() != 'org::allbinary::debug::NoDebug'->getInstance()) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($resource)->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(("" . ($value)))->toString(), $self, "addResource");
            if ($self->containsDuplicate($resource, $value)) {
                'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::string::StringMaker'->new()->append("Found Duplicate Resource: ")->append($resource)->toString(), $self);
            }
        }
        $self->{hashMap}->put($resource, $value);
}


sub containsDuplicate {
    my ($self, $resource, $value) = @_;
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($self->{hashMap});
        for (my $index = scalar(@{$objectArray}); --$index >= 0; ) {
            my $integer = $self->{hashMap}->get($objectArray->[$index]);
            if ($resource ne $objectArray->[$index]) {
                if ($value != $integer) {
                    if (int($value) == int($integer)) {
                        return 1;
                    }
                }
            }
        }
        return 0;
}


sub setResources {
    my ($self, $resources) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Resource Loader: ")->append(ref($resources))->toString(), $self, "setResources");
        $self->{resources} = $resources;
}


# throws Exception
sub getResourceAsStream {
    my ($self, $resource) = @_;
        my $integer = $self->{hashMap}->get($resource);
        my $id = int($integer);
        my $resources = ($self->{resources});
        my $inputStream = $resources->openRawResource($id);
        if (defined($inputStream)) {
            return $inputStream;
        }
        return $inputStream;
}

# use java::io::InputStream;
use android::app::Activity;
use android::content::Context;
use android::content::res::Resources;
use org::allbinary::debug::DebugFactory;
use org::allbinary::debug::NoDebug;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::HashtableUtil;

1;

