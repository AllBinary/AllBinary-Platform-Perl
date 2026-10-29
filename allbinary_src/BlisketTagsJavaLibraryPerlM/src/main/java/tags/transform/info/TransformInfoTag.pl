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

package tags::transform::info::TransformInfoTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::ModifyTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{storeName} = undef;
    $self->{objectFile} = undef;
    $self->{anyType} = undef;
    $self->{objectConfigFile} = undef;
    $self->{objectConfig} = undef;
    $self->{templateFile} = undef;
    $self->{template} = undef;
    $self->{dataFile} = undef;
    $self->{data} = undef;
    $self->{type} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransformInfoTag takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new('taghelpers::transform::info::TransformInfoRequestHelperFactory'->new());
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $tagHelperFactoryInterface) = @_;
    my $self = $class->SUPER::new($tagHelperFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $self->{name});
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
}


sub setObjectFile {
    my ($self, $value) = @_;
        $self->{objectFile} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OBJECTFILENAME}, $self->{objectFile});
}


sub setObject {
    my ($self, $value) = @_;
        $self->{anyType} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OBJECT}, $self->{anyType});
}


sub setTemplateFile {
    my ($self, $value) = @_;
        $self->{templateFile} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATEFILENAME}, $self->{templateFile});
}


sub setTemplate {
    my ($self, $value) = @_;
        $self->{template} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATE}, $self->{template});
}


sub setDataFile {
    my ($self, $value) = @_;
        $self->{dataFile} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{DATAFILENAME}, $self->{dataFile});
}


sub setData {
    my ($self, $value) = @_;
        $self->{data} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{DATA}, $self->{data});
}


sub setObjectConfigFile {
    my ($self, $value) = @_;
        $self->{objectConfigFile} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OBJECTCONFIGFILENAME}, $self->{objectConfigFile});
}


sub setObjectConfig {
    my ($self, $value) = @_;
        $self->{objectConfig} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OBJECTCONFIG}, $self->{objectConfig});
}


sub setType {
    my ($self, $value) = @_;
        $self->{type} = $value;
        $self->getPropertiesHashMap()->put('org::allbinary::logic::io::OutputTypeData'->getInstance()->{NAME}, $self->{type});
        if ($tags::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF("TransformInfoTag type set: " . $self->{type}, $self, "setType");
        }
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getObjectFile {
    my ($self) = @_;
        return $self->{objectFile};
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            return $self->SUPER::doStartTag();
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::TagHelperFactoryInterface;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::OutputTypeData;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use taghelpers::transform::info::TransformInfoRequestHelperFactory;
use tags::ModifyTag;

1;

