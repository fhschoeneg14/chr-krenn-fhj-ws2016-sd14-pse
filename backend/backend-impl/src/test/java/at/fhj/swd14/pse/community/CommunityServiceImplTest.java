package at.fhj.swd14.pse.community;


import static org.mockito.Mockito.times;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.NamingException;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import at.fhj.swd14.pse.converter.CommunityConverter;
import at.fhj.swd14.pse.converter.PersonConverter;
import at.fhj.swd14.pse.converter.StatusConverter;
import at.fhj.swd14.pse.converter.UserConverter;
import at.fhj.swd14.pse.person.PersonDto;
import at.fhj.swd14.pse.person.PersonImage;
import at.fhj.swd14.pse.repository.CommunityRepository;
import at.fhj.swd14.pse.repository.PersonRepository;
import at.fhj.swd14.pse.repository.PersonStatusRepository;
import at.fhj.swd14.pse.user.User;
import at.fhj.swd14.pse.user.UserService;
import org.junit.Assert;

@RunWith(MockitoJUnitRunner.class)
public class CommunityServiceImplTest {

	@InjectMocks
	private CommunityServiceImpl service;
	
	@Mock
	private CommunityRepository communityRepo;
	
	
	private Community community;
	private Community communityWithData;
	private List<Community> communities;

	@Before
	public void setup() throws NamingException
	{
		
        community = CommunityTestHelper.getTestCommunity();
        communityWithData = CommunityTestHelper.getTestCommunityWithData();

	}
	
	@Test
	public void testFind()
	{
		Mockito.when(communityRepo.find(1L)).thenReturn(community);
		CommunityDto expectedCommunity = service.find(1L);
		
		
		
	}
	
	@Test
	public void testSaveCommunity()
	{
		CommunityDto dummyCommDto = CommunityConverter.convert(communityWithData);
		service.save(dummyCommDto);
		
		Mockito.verify(communityRepo,Mockito.times(1)).save(Mockito.any(Community.class));
	}
	
	@Test(expected=NullPointerException.class)
	public void testSaveCommunityFails() {
		
		CommunityDto dummyCommDto = CommunityConverter.convert(community);
		service.save(dummyCommDto);
		
	}
	
	
	@Test
	public void testFindByAuthorId()
	{		
		//TODO anpassen bei der Implementierung, da sonnst error
		//Assert.assertNull(service.findByAuthorId(1L));
	}
	
	@Test
	public void testFindUserRelated(){
		//TODO anpassen bei der Implementierung, da sonnst error
		Assert.assertNull(service.findUserRelated(1L));
		
	}
	
	
	
	
	
}