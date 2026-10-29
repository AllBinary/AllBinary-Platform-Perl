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

#and hidden field removal
package tags::StoreWorkFlowTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::HelperTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{viewName} = undef;
    $self->{viewFile} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('taghelpers::StoreTagWorkFlowHelperFactory'->new());
    $self->_init_fields();
        # super(...) made $self above
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub setName {
    my ($self, $value) = @_;
        $self->{viewName} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $self->{viewName});
}


# throws Exception
sub process {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
            }
            my $helperClass = ref($self->getHelper());
            my $method = $helperClass->getMethod($self->{commonStrings}->{PROCESS}, undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return int($result);
        } catch ($e) {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
            }
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{tagStrings}->{DO_START_TAG});
            }
            $self->setHelper();
            return $self->process();
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use taghelpers::StoreTagWorkFlowHelperFactory;
use tags::HelperTag;

1;

