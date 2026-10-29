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

package org::allbinary::data::generator::UniqueIdGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::generator::IdGeneratorInterface';

our $EXT = ".unq";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{idGeneratorEntity} = undef;
    $self->{name} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{idGeneratorEntity} = 'org::allbinary::data::tables::generator::IdGeneratorEntityFactory'->getInstance();
    return $self;
}


sub initialize {
    my ($self, $value) = @_;
        try {
            my $vector = 'org::allbinary::util::BasicArrayListD'->new();
            $vector->add($self->{name});
            $vector->add(("" . ($value))->toString());
            $self->{idGeneratorEntity}->insert($vector);
        } catch ($e) {
            if ($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "initialize", $e);
            }
        }
}


# throws Exception
sub setFile {
    my ($self, $filePathName, $name) = @_;
        $self->{name} = $name;
}


# throws IOException
sub getNext {
    my ($self) = @_;
        try {
            my $idLong = $self->{idGeneratorEntity}->get($self->{name});
            my $newValue = ("" . (int($idLong) + 1));
            $self->{idGeneratorEntity}->update($self->{name}, $newValue);
            return ("" . ($idLong));
        } catch ($e) {
            if ($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{IDLOGGING})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getNext", $e);
            }
            return "Error";
        }
}

# use java::io::IOException;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::generator::IdGeneratorEntity;
use org::allbinary::data::tables::generator::IdGeneratorEntityFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::data::generator::IdGeneratorInterface;

1;

