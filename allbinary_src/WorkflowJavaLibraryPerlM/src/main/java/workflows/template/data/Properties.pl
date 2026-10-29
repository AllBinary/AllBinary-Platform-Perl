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

package workflows::template::data::Properties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF("Start/Tag", $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
    return $self;
}


sub getPropertiesHashMap {
    my ($self) = @_;
        return $self->{propertiesHashMap};
}


sub doEndTag {
    my ($self) = @_;
        if ($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($workflows::template::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF("Tag Ended", $self, "doEndTag");
        }
        $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        return $javax::servlet::jsp::tagext::TagSupport::EVAL_PAGE;
}

use java::util::HashMap;
# use javax::servlet::jsp::tagext::TagSupport;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

