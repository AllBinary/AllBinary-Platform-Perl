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

package taghelpers::transform::info::TransformInfoRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{transformInfoInterface} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{transformInfoInterface} = 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreNoManipulation'->new($propertiesHashMap, $pageContext);
    return $self;
}


sub update {
    my ($self) = @_;
        try {
            my $success = "Updated Successfully";
            my $hashMapData = $self->{transformInfoInterface}->toHashMap();
            'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->update($hashMapData);
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update storefronts table";
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


sub insert {
    my ($self) = @_;
        try {
            my $success = "Added TransformInfo Successfully";
            my $values = $self->{transformInfoInterface}->toVector();
            'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->insert($values);
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add storefronts table";
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            my $success = "Delete Successfully";
            'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->delete($self->{transformInfoInterface}->getKey());
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "delete()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to delete storefronts table";
            if ($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use admin::taghelpers::ModifyTable;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreNoManipulation;

1;

