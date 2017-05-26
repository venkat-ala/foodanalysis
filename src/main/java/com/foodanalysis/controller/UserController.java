package com.foodanalysis.controller;

import static org.apache.commons.collections.CollectionUtils.isEmpty;
import static org.apache.commons.lang3.StringUtils.isNotEmpty;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;
import com.foodanalysis.validator.UserUpdateValidator;
import com.foodanalysis.validator.UserValidator;

@SuppressWarnings("deprecation")
@Controller
public class UserController {

	private static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private UserUpdateValidator userUpdateValidator;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/")
	public String welcome() {
		return "index";
	}

	@RequestMapping(value = "/usrregistration", method = RequestMethod.GET)
	public String registration(@RequestParam(required = false) String page, Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("page", page);
		return "userRegistration";
	}

	@RequestMapping(value = "/userloginview", method = RequestMethod.GET)
	public String login(@RequestParam(required = false) String page, Model model) {
		if ("admin".equals(page)) {
			model.addAttribute("page", "admin");
		}
		return "userLogin";
	}

	@RequestMapping(value = "/userprofile/{id}", method = RequestMethod.GET)
	public String gotoUserProfile(@PathVariable int id, Model model, @RequestParam(required = false) String page) {
		User user = null;
		try {
			user = userService.doGetUserById(id);
			model.addAttribute("user", user);
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "/userProfile";
	}

	@RequestMapping(value = "/doRegisterUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, BindingResult bindingResult,
			@RequestParam(required = false) String page, Model model, HttpSession session) {
		try {
			if ("admin".equals(page)) {
				model.addAttribute("page", "admin");
			}
			userValidator.validate(user, bindingResult);
			if (bindingResult.hasErrors()) {
				return "userRegistration";
			}
			userService.doSaveUser(user, "admin".equals(page) ? "admin" : "user");
			model.addAttribute("info", "Account created successfully. Goto login page for login...");
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "userRegistration";
	}

	@RequestMapping(value = "/doUpdateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, BindingResult bindingResult, Model model,
			@RequestParam(required = false) String page, HttpSession session) {
		try {
			userUpdateValidator.validate(user, bindingResult);
			if (bindingResult.hasErrors()) {
				return "userProfile";
			}
			if ("adminEdit".equals(page)) {
				user.setStatus("c");
			}
			user = userService.doUpdateUser(user);
			if (!"adminEdit".equals(page)) {
				session.setAttribute("user", user);
			}
			model.addAttribute("info", "User updated successfully");
			return "".equals(page) ? "redirect:views/userDashboard.jsp?suc=usr_upd_suc"
					: "redirect:viewUsers?msg=user_upd_success";
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "userProfile";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String login(@RequestParam String email, @RequestParam String password,
			@RequestParam(required = false) String dbapassword, @RequestParam(required = false) String page,
			Model model, HttpSession session) {
		try {
			if ("admin".equals(page)) {
				model.addAttribute("page", "admin");
			}
			if (!EmailValidator.getInstance().isValid(email)) {
				model.addAttribute("error", "Invalid email id");
			}
			User user = userService.doAuthenticateUser(email, password, dbapassword, page);
			session.setAttribute("user", user);

			return "redirect:views/userDashboard.jsp";
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "userLogin";
	}

	@RequestMapping(value = "/doChangeUserPassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("passwordString") String password,
			@RequestParam("confirmPasswordString") String confirmPassword, @RequestParam Integer userId,
			@RequestParam(required = false) String page, @RequestParam(required = false) String dbaPwd,
			@RequestParam(required = false) String confDbaPwd, Model model, HttpSession session) {
		try {
			if (password != null && !password.equals(confirmPassword)) {
				model.addAttribute("error", "Password and Confirm Password mismatch");
			} else if (password != null && password.length() < 5) {
				model.addAttribute("error", "Password should be atleast 5 character.");
			} else if ("admin".equals(page) && !dbaPwd.equals(confDbaPwd)) {
				model.addAttribute("error", "DBA Password and Confirm DBA Password mismatch");
			} else if (dbaPwd != null && dbaPwd.length() < 5) {
				model.addAttribute("error", "DBA Password should be atleast 5 character.");
			} else {
				userService.doUpdateUserPassword(userId, page, password, dbaPwd);
				return "redirect:views/index.jsp?msg=pwd_suc";
			}
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "userChangePassword";
	}

	@RequestMapping(value = "/forgotpwd", method = RequestMethod.POST)
	public String changePassword(@RequestParam String email, @RequestParam String favFriendName,
			@RequestParam String favMovieName, Model model, @RequestParam(required = false) String page) {
		try {
			User user = userService.doGetUserByEmail(email);
			if (user == null) {
				model.addAttribute("error", "Email not registered");
			} else if (user.getRole().equals("user") && !page.isEmpty()) {
				model.addAttribute("error", "Invalid login");
			} else if (user.getRole().equals("admin") && !user.getRole().equals(page)) {
				model.addAttribute("error", "Invalid login");
			} else if (user.getFavFriendName().equals(favFriendName) && user.getFavMovieName().equals(favMovieName)) {
				if (user.getStatus().equals("d")) {
					throw new BusinessServiceException("Account is inactive");
				}
				return "redirect:views/userChangePassword.jsp?userId=" + user.getId() + "&page=" + page;
			} else {
				model.addAttribute("error", "Invalid answers");
			}
			return "userForgotPwd";
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "userForgotPwd";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		try {
			session.invalidate();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public String gotoUserProfile(Model model) {
		List<ContactUsInfo> contact = null;
		try {
			contact = userService.doGetAllContactUsInfo();
			model.addAttribute("contactus", contact);
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "contact";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchItem", method = RequestMethod.GET)
	public String searchItem(Model model, @RequestParam(required = false) String search,
			@RequestParam(required = false) String ing1, @RequestParam(required = false) String ing2,
			@RequestParam(required = false) String view, HttpSession session) {
		List<SearchItem> search1 = null;
		List<SearchItem> search2 = null;
		try {
			if ("view1".equals(view)) {
				Object[] res = userService.doGetSearchItems(ing1, ing2);
				search1 = (List<SearchItem>) res[0];
				search2 = (List<SearchItem>) res[1];
				model.addAttribute("search1", search1);
				model.addAttribute("search2", search2);
				model.addAttribute("view", "view1");
			} else {
				Object[] res = userService.doGetSearchItems(search, null);
				search1 = (List<SearchItem>) res[0];
				model.addAttribute("search1", search1);
			}
			if (isEmpty(search1) && StringUtils.isEmpty(ing1)) {
				model.addAttribute("searchInfo", "No records found...Try another search");
				model.addAttribute("view", "view1");
			} else if (isEmpty(search1) && isEmpty(search2) && isNotEmpty(ing1)) {
				model.addAttribute("searchInfo", "No records found");
				model.addAttribute("view", "view1");
			}
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "searchItems";
	}

	@RequestMapping(value = "/contactusSendEmail", method = RequestMethod.POST)
	public String searchItem(Model model, @RequestParam String fromEmail, @RequestParam String toEmail,
			@RequestParam String cQuery) {
		try {
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom("Food_analysis");
			msg.setTo(toEmail);
			msg.setSubject("Contactus Query");
			msg.setText("User " + fromEmail + " , asked Query : " + cQuery);
			mailSender.send(msg);
			model.addAttribute("info", "Query send successfully.");
			List<ContactUsInfo> contact = userService.doGetAllContactUsInfo();
			model.addAttribute("contactus", contact);
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}
		return "contact";
	}

	@RequestMapping(value = "/viewUsers", method = RequestMethod.GET)
	public String viewUsers(Model model, HttpSession session, @RequestParam(required = false) String msg) {
		List<User> users = null;
		try {
			User user = (User) session.getAttribute("user");
			users = userService.doGetAllUsers(user);

			model.addAttribute("userList", users);

			List<SearchItem> items = userService.doGetAllFoodItems();
			model.addAttribute("foodItems", items);
			model.addAttribute("info", msg);

			List<ContactUsInfo> contact = userService.doGetAllContactUsInfo();
			model.addAttribute("contactus", contact);
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "viewUsers";
	}

	@RequestMapping(value = "/userStatusUpdate/{userId}", method = RequestMethod.GET)
	public String adminUserStsUpdate(@PathVariable int userId, Model model, HttpSession session,
			@RequestParam String sts) {
		List<User> users = null;
		try {
			userService.doChangeAdminUserStatus(userId, sts);
			User user = (User) session.getAttribute("user");
			users = userService.doGetAllUsers(user);
			model.addAttribute("userList", users);
			model.addAttribute("info", "User updated successfully");
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "viewUsers";
	}

	@RequestMapping(value = "/manageFoodItems", method = RequestMethod.GET)
	public String loadFoodItems(Model model) {
		List<SearchItem> items = null;
		try {
			items = userService.doGetAllFoodItems();
			model.addAttribute("foodItems", items);
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "foodItemsManage";
	}

	@RequestMapping(value = "/deleteFoodItems/{itemId}", method = RequestMethod.GET)
	public String deleteFoodItem(Model model, @PathVariable int itemId, @RequestParam(required = false) String page) {
		List<SearchItem> items = null;
		try {
			userService.doDeleteFoodItem(itemId);
			items = userService.doGetAllFoodItems();
			model.addAttribute("foodItems", items);
			model.addAttribute("info", "Item deleted successfully.");
			if ("viewusers".equals(page)) {
				return "redirect:/viewUsers?msg=food item deleted successfully";
			}
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "foodItemsManage";
	}

	@RequestMapping(value = "/foodItem/{id}", method = RequestMethod.GET)
	public String loadFoodItem(@PathVariable int id, Model model, @RequestParam(required = false) String page) {
		SearchItem searchItem = null;
		try {
			searchItem = userService.doGetFoodItemById(id);
			model.addAttribute("foodItem", searchItem);
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
		}
		return "/foodItemEdit";
	}

	@RequestMapping(value = "/createFoodItem", method = RequestMethod.GET)
	public String loadFoodItem(Model model) {
		SearchItem searchItem = null;
		try {
			searchItem = new SearchItem();
			model.addAttribute("foodItem", searchItem);
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}
		return "/foodItemEdit";
	}

	@RequestMapping(value = "/doUpdateSearchItem", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("foodItem") SearchItem searchItem, Model model,
			@RequestParam(required = false) String page) {
		try {
			userService.doUpdateFoodItem(searchItem);
			List<SearchItem> items = userService.doGetAllFoodItems();
			model.addAttribute("foodItems", items);
			model.addAttribute("info", "Food Item updated successfully");
			if ("viewusers".equals(page)) {
				return "redirect:viewUsers?msg=food item updated successfully";
			}
		} catch (BusinessServiceException e) {
			model.addAttribute("error", e.getMessage());
			logger.error(e.getMessage(), e);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("error", "System has some issue...");
		}
		return "foodItemsManage";
	}
}
