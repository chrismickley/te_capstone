<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <link rel="stylesheet" href="css/site.css" /> -->
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<link rel="stylesheet" href="css/siteToo.css" />
<h1>About The Developers</h1>

<main class="main-area">

  <div class="centered">

    <section class="cards">

      <article class="card">
        <a href="#">
          <figure class="thumbnail">
          <img src="img/bruce.jpg" alt="meow">
          </figure>
          <div class="card-content">
            <h2>Bruce</h2>
           <p><span class="name"><u>Bruce Stull</u></span> has had a strange path to the world of programming.
	Starting as a youth, he was interested in becoming an inventor when he
	grew up. He worked with electronic kits, chemistry kits, built stuff,
	and started welding in his high school years.</p>
<p>As far as programming, Bruce spent his time typing in programs
	from a Commodore 64 user magazine. He didn't really understand the
	reasons for the PEEKS AND POKES but had fun seeing the results of his
	typing labor. Cartidge games were his mainstay.</p>
<p>After high school, he enlisted in the US Navy and spent his time
	working in the belly of ships. Maintaining WW2 era bilge pumps and
	other machinery kept his attention while serving onboard USS Vulcan
	AR-5.</p>

<p>Upon completing his enlistment, he enrolled for studies at The
	University of Akron. Mechanical engineering provided an opportunity for
	him to explore programming again and--this time--actually understand
	what the code does. Can't solve an engineering problem without
	understanding how to tell the computer to calculate what he wanted.</p>
<p>For the past 9 years, he has spent his time helping veterans
	overcome their fear of technology at the VA Central Ohio Health Care
	System. Facilitating a group to help enrich veteran's lives was
	extremely satisfying for him.</p>
<p>He is currently graduating from Java coding bootcamp at Tech
	Elevatory Columbus and is looking forward to starting a career with JPM
	Chase. He hopes to work in UI development to provide effective access
	to individuals with any number of disabilities, visual or cognitive.</p>
          </div>
          <!-- .card-content -->
        </a>
      </article>
      <!-- .card -->

      <article class="card">
        <a href="#">
          <figure class="thumbnail">
            <img src="img/chris.jpg" alt="meow">
          </figure>
          <div class="card-content">
            <h2>Chris</h2>
            <p><span class="name"><u>Chris Mickley</u></span> started his technology career in the US Air Force as 
	a SIGINT analyst.  He has worked in various capacities in Information Technology for the 
	nearly 20 years, and recently decided to learn development skills to improve his 
	skills and marketability.</p>
            
          </div>
          <!-- .card-content -->
        </a>
      </article>
      <!-- .card -->

      <article class="card">
        <a href="#">
          <figure class="thumbnail">
            <img src="img/matt.jpg" alt="meow">
          </figure>
          <div class="card-content">
            <h2>Matt</h2>
            <p><span class="name"><u>Matt Hawley</u></span> has been a dedicated software delivery 
	professional for twelve years, with experience in Quality Assurance, Business 
	Analysis and UX design. He will be graduating from Tech Elevator to rejoin his 
	team at JP Morgan Chase as a newly minted full stack java developer.</p>
          </div>
          <!-- .card-content -->
        </a>
      </article>
      
      <!-- .card -->

    </section>
    <!-- .cards -->

  </div>
  <!-- .centered -->

</main>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
