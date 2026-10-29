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

#and remove the hidden fields
package tags::workflow::processing::basic::BasicWorkFlowTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreWorkFlowTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($tags::workflow::processing::basic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::workflow::processing::basic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::workflow::processing::basic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::workflow::processing::basic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{tagStrings}->{DO_START_TAG});
            }
            $self->getPropertiesHashMap()->put($org::allbinary::business::DynamicObjectData::NAME, "workflows.template.data.BasicStoreWorkFlow");
            return $self->SUPER::doStartTag();
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use tags::StoreWorkFlowTag;

1;

